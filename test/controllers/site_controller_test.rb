require 'test_helper'

class SiteControllerTest < ActionDispatch::IntegrationTest
  include BlogPostsHelper

  test "should get index" do
    get root_url
    assert_response :success
    assert_select '.blog-post', 1
    assert_select '.blog-post__description', process_blog_content(blog_posts(:melhor_cartao_de_credito))
  end

  test 'should display meta tags' do
    get root_url

    assert_select "meta[name=#{meta_tags(:brazil_language).name}]", 1
    assert_select "meta[content=#{meta_tags(:brazil_language).value}]", 1
    assert_select "meta[name=#{meta_tags(:card_description).name}]", 0
    assert_select "meta[name=#{meta_tags(:card_keywords).name}]", 0
    assert_match /teste/, response.body
  end

  test 'should get legal terms' do
    get term_of_uses_url
    assert_response :success
  end

  test 'should has blog link' do
    get root_url
    assert_match '<a href="http://blog.triunfei.com" target="_blank">Blog</a>', response.body
  end

  test 'shouldnt has blog link' do
    get "#{root_url}/es"
    assert_no_match '<a href="http://blog.triunfei.com" target="_blank">Blog</a>', response.body
  end

  test 'shouldnt has landing link' do
    get root_url
    assert_no_match 'A melhor conta para voce', response.body
  end
end
