class ArticlesController < ApplicationController
  def index
    respond_to do |format|
      format.rss do
        @articles = articles
        render layout: false
      end
    end
  end

  def show
    @articles = [article]
    render 'home/index'
  end

  def article
    @article ||= Article.find_by_slug(params[:id])
  end

  def articles
    @articles ||= Article.where('published IS NOT NULL').order('published DESC').limit(100)
  end
end
