module ApplicationHelper
  def title(page_title)
    base_title = "Marmaris"
      if page_title.nil?
        base_title
      else
        "#{base_title} | #{@title}"
    end
  end
end
