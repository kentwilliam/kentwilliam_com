class HomeController < ArticlesController
  def index
    @article ||= articles[0]
    @articles ||= articles
  end
end
