module ApplicationHelper
  def page_title
    @page_title || 'Kent William Innholt: Delight & Empower'
  end

  def page_description
    @page_description || default_description
  end

  def page_author
    "Kent William Innholt"
  end

  def page_type
    if current_page?(root_url)
      "website"
    else
      "article"
    end
  end

  def page_url
    request.original_url
  end

  def page_share_image
    asset_url "open_graph_generic.jpg"
  end

  def default_description
    "I'm a designer-developer with my heart in interaction design and web engineering."
  end
end
