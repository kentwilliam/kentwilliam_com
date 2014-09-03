class ArticlesController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        redirect_to root_path
      end
      format.rss do
        @articles = articles
        render layout: false
      end
    end
  end

  def show
    @page_title = "#{article.title} // Kent William Innholt"
    @page_description = article_description
    @articles = [article]
    render 'home/index'
  end

  def article
    @article ||= Article.find_by_slug(params[:id])
  end

  def articles
    @articles ||= Article.where('published IS NOT NULL').order('published DESC').limit(100)
  end

  def article_description
    @article_description ||= begin
      first_paragraph = /<p>.*?<\/p>/.match(article.html)[0]
      first_paragraph && first_paragraph.gsub(/<[^>]*>/, '').gsub('"','\\"')
    end
  end
end
