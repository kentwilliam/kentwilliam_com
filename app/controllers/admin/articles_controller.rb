require 'pygments'

class Admin::ArticlesController < ApplicationController
  def index
  end

  def edit
  end

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
