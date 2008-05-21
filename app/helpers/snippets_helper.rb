module SnippetsHelper
  def link_tags(snippet)
    snippet.tag_list.map do |tag|
      link_to h(tag), tag_path(:id => tag)
    end.join(' ')
  end
end
