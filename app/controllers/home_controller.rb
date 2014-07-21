class HomeController < ApplicationController
  def index
    @articles = Article.where('published IS NOT NULL').order('published desc')
  end
end
