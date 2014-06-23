require 'pygments'

class Admin::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    article = Article.new
    article.published = nil
    article.save
    redirect_to admin_articles_path
  end

  def edit
    @article = article
  end

  def update
    article.title = params[:title]
    article.markdown = params[:markdown]
    article.html = rendered_content
    article.save
    head :ok
  end

  def article
    @article ||= Article.find params[:id]
  end

  # Preview functionality for more pleasant blog writin'

  def preview
    render text: rendered_content
  end

  def rendered_content
    highlight(markdown.render params[:markdown])
  end

  def highlight(html)
    document = Nokogiri::HTML.fragment(html)
    document.css("code").each do |code|
      language = code.get_attribute 'class'
      code.inner_html = pygmentize code.content, language
    end
    document.to_html
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
  end

  def pygmentize string, language
    Pygments.highlight string, lexer: language
  end
end
