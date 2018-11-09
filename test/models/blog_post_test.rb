require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase

  test 'validations' do
    blog_post = BlogPost.new
    blog_post.save

    assert_not_empty blog_post.errors[:original_post_id]
    assert_not_empty blog_post.errors[:title]
    assert_not_empty blog_post.errors[:summary]
    assert_not_empty blog_post.errors[:content]
  end

  test 'scopes' do
    assert_equal BlogPost.visible.to_a, [blog_posts(:melhor_cartao_de_credito)]
  end

  test 'imports all available feed data and processes summary' do
    blog_feed_mock = File.read(Rails.root.join("test", "fixtures", "files", "blog_feed.xml"))
    spy = Spy.on(BlogPost, :fetch_blog_feed).and_return(Feedjira::Feed.parse(blog_feed_mock))

    BlogPost.import

    assert spy.has_been_called?
    assert_equal 5, BlogPost.count
  end
end