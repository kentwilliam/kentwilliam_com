require 'pygments'

class Admin::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    article = Article.new
    article.published = nil
    article.save!
    pp 'created article', article
    redirect_to admin_articles_path
  end

  def edit
    @article = article
  end

  def update
    article.title = params[:title]
    article.content = params[:content]
    article.save
    head :ok
  end

  def article
    @article ||= Article.find params[:id]
  end

  # Preview functionality for more pleasant blog writin'

  def preview
    render text: highlight(markdown.render params[:content])
  end

  def highlight(html)
    document = Nokogiri::HTML(html)
    document.search("//code").each do |code|
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
