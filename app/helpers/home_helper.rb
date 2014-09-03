module HomeHelper
  def page_description
    @page_description || default_description
  end

  def default_description
    "Kent William Innholt is a Norwegian designer-developer with his heart in interaction design and web engineering."
  end
end
