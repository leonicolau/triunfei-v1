# frozen_string_literal: true

class BlogPost < ApplicationRecord
  acts_as_paranoid

  validates :original_post_id, presence: true, uniqueness: true
  validates :title, :summary, :content, presence: true

  scope :visible, -> { where(visible: true) }
  default_scope -> { order(position: :asc) }
  # rubocop:disable Style/PercentLiteralDelimiters
  enum post_type: %i[credit_card account loan]
  # rubocop:enable Style/PercentLiteralDelimiters

  def self.import
    (1..2).each do |page|
      feed = fetch_blog_feed(page)
      feed.entries.each do |entry|
        create_or_update_from_post(entry)
      end
    end
  end

  # can't make this private, other I can't spy on this (unit test)
  def self.fetch_blog_feed(page = 1)
    url = Rails.application.secrets.blog_url
    Feedjira::Feed.fetch_and_parse("#{url}?paged=#{page}")
  end

  def self.create_or_update_from_post(blog_post)
    original_post_id = blog_post.entry_id.split('=').last
    post = where(original_post_id: original_post_id).first_or_initialize
    post.title = blog_post.title
    post.url = blog_post.url
    post.published_at = blog_post.published
    post.summary = clean_up_summary(blog_post.summary)
    post.content = blog_post.content
    post.save
  end

  def self.clean_up_summary(summary_html)
    # remove from summary the last paragraph with information about the original post
    summary = Nokogiri::HTML.fragment(summary_html)
    summary.search('p').last.remove
  end
end
