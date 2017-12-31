class HomeController < ArticlesController
  def index
    @articles ||= articles
  end
end
