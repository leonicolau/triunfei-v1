require 'test_helper'

class LandingPagesControllerTest < ActionDispatch::IntegrationTest
  include BlogPostsHelper

  test "should get index" do
    get "#{root_url}/o-melhor-cartao-de-credito"

    assert_response :success
    assert_select '.blog-post', 1
    assert_select '.blog-post__description', process_blog_content(blog_posts(:melhor_cartao_de_credito))
    # assert_select '.blog-post__img[src="http://blog.triunfei.com/teste/test.jpg"]', 1

    assert_select '.h1_lp', landing_pages(:o_melhor_cartao_para_voce).name
    assert_select '#landing-text1', landing_pages(:o_melhor_cartao_para_voce).text1
    assert_select '#landing-text2', landing_pages(:o_melhor_cartao_para_voce).text2
  end

#  test 'should has title' do

#   visit "#{root_url}/#{landing_pages(:o_melhor_cartao_para_voce).slug}"

#    click_link 'O melhor cartao de credito para voce'

#    assert_equal "/o-melhor-cartao-de-credito", current_path

#    assert page.has_title?('Esse é o melhor cartao de credito para voce')
#  end

end
