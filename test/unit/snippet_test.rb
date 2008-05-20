require 'test_helper'

class SnippetTest < ActiveSupport::TestCase
  def test_tag_string_on_new_snippet
    assert_equal 0, tags(:ruby).snippets.count
    snippet = Snippet.create(:name => 'Hello World', :body => 'puts "hello world"', :tags_string => 'ruby helloworld')
    assert snippet.errors.empty?
    assert_equal 'ruby helloworld', snippet.tags_string
    assert_equal 2, snippet.tags.count
    assert_equal 1, Tag.find_by_name('ruby').snippets.count
    assert_equal 1, Tag.find_by_name('helloworld').snippets.count
  end
  
  def test_tag_string_on_existing_snippet
    snippet = Snippet.create(:name => 'Hello World', :body => 'puts "hello world"', :tags_string => 'ruby helloworld')
    # now change it
    snippet.tags_string = 'ruby simple'
    snippet.save
    assert snippet.errors.empty?
    assert_equal 'ruby simple', snippet.tags_string
    assert_equal 2, snippet.tags.count
    assert_equal 1, Tag.find_by_name('ruby').snippets.count
    assert_equal 1, Tag.find_by_name('simple').snippets.count
    assert_equal 0, Tag.find_by_name('helloworld').snippets.count
  end
end
