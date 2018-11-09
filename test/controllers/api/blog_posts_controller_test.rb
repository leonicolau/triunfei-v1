require 'test_helper'

module Api
  class BlogPostsControllerTest < ActionDispatch::IntegrationTest
    test '#index returns visible blog posts' do
      get api_blog_posts_path

      result = JSON.parse(response.body)
      assert_equal 1, result.size
      assert_equal blog_posts(:melhor_cartao_de_credito).id, result[0]['id']
    end
  end
end
