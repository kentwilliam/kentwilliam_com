class Article < ActiveRecord::Base
  before_save :update_slug

  # Slugs only added once, i.e. constant URLs
  def update_slug
    if published.nil? && title
      self.slug = title.parameterize
    end
  end

  def to_param
    slug
  end
end
