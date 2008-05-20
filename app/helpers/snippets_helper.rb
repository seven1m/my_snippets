module SnippetsHelper
  def tagify(tags)
    tags = tags.split if tags.is_a? String
    tags.map { |tag| link_to(tag, tag_path(:id => tag)) }.join(', ')
  end
end
