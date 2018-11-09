require 'test_helper'

class PostbackUrlJobTest < ActiveJob::TestCase
  test 'postback url job scheduling' do
    assert_enqueued_jobs 1 do
      PostbackUrlJob.perform_later "http://triunfei.com"
    end
  end

  test 'that postback url job is processed' do
    perform_enqueued_jobs do
      PostbackUrlJob.perform_later "http://triunfei.com"
    end
    assert_performed_jobs 1
  end

  test 'that postback url job executes an http get request' do
    PostbackUrlJob.perform_now "http://triunfei.com"
  end
end
