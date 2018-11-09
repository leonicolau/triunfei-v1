# frozen_string_literal: true

module BlogPostsHelper
  def extract_img(blog_post)
    img = blog_post.content.match(/src(\s*=\s*"(.+?)")/)&.captures

    return 'bitmap.jpg' if img.nil?

    img[1]
  end

  def grouped_blog_posts(blog_posts)
    grouped = []

    blog_posts.in_groups_of(3, false).each_with_index do |blogs, index|
      if (index % 3).zero?
        grouped << blogs
      else
        grouped << blogs[0..1]
        grouped << [blogs[2]] if blogs[2]
      end
    end

    grouped
  end

  def process_blog_content(blog)
    Rails::Html::FullSanitizer.new.sanitize blog.content[0..300]
  end
end
