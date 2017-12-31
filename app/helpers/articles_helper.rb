module ArticlesHelper
  def article_publish_time
    if @article.published
      @article.published.to_time.strftime('%B %e %Y, %l:%M %p')
    else
      'Unpublished'
    end
  end
end
