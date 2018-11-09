# frozen_string_literal: true
require 'test_helper'

class BlogPostsHelperTest < ActionView::TestCase

  test 'process_blog_content' do
    
    blog = BlogPost.new(content: 'a' * 400)
    
    # should return first 300 chars
    assert_equal 'a' * 301, process_blog_content(blog)
    
    blog = BlogPost.new(content: '<h1>aaa</h1><p>bbb</p>')

    # should replace <h1> and <p> to empty string
    assert_equal 'aaabbb', process_blog_content(blog)
  end

end
