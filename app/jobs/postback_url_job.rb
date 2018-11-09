# frozen_string_literal: true

class PostbackUrlJob < ApplicationJob
  queue_as :default

  require 'net/http'
  # rubocop:disable Lint/UriEscapeUnescape, Lint/UnneededDisable
  def perform(url)
    escaped_address = URI.escape(url)
    uri = URI.parse(escaped_address)
    Net::HTTP.get(uri) # ignore the result
  end
  # rubocop:enable Lint/UriEscapeUnescape, Lint/UnneededDisable
end
