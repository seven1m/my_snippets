module SnippetsHelper
  def link_tags(tag_list)
    tag_list.map do |tag|
      link_to h(tag), tag_path(:id => tag)
    end.join(' ')
  end
  
  def format_code(code)
    '<pre><code>' +
    h(code).gsub(/##\s(.+)\s*/, '</code></pre><h2>\1</h2><pre><code>') +
    '</code></pre>'
  end
end
