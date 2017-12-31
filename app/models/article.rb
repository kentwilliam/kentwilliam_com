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

  def formatted_publish_time
    return 'Unpublished' unless self.published

    time = self.published.to_time

    if time.year == Time.now.year
      time.strftime('%B %e')
    else
      time.strftime('%B %e, %Y')
    end
  end

  def formatted_summary
    paragraphs = /<p>.*?<\/p>/.match(self.html)
    return "" if paragraphs.nil?
    first_paragraph = paragraphs[0]
    first_paragraph && first_paragraph.gsub(/<[^>]*>/, '').gsub('"','\\"')
  end
end
