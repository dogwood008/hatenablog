require 'test_helper'

require 'hatenablog/configuration'

module Hatenablog
  class ConfigurationTest < Test::Unit::TestCase
    sub_test_case 'correct configuration' do
      setup do
        @sut = Hatenablog::Configuration.new('test/fixture/test_conf.yml')
      end

      test 'consumer key' do
        assert_equal 'cMOVPffXo7LiL317UeaiEQ==', @sut.consumer_key
      end

      test 'consumer secret' do
        assert_equal '0987654321ZYXWVUTSRQPONML=', @sut.consumer_secret
      end

      test 'access token' do
        assert_equal 'oGoYArVaBWpNSKp9ljXm+g==', @sut.access_token
      end

      test 'access token secret' do
        assert_equal '7OgCvJW/GPbFnAnIHgG2t1ivdzxrvZTdvJl/yA==', @sut.access_token_secret
      end

      test 'user ID' do
        assert_equal 'test_user', @sut.user_id
      end

      test 'blog ID' do
        assert_equal 'test-user.hatenablog.com', @sut.blog_id
      end
    end

    sub_test_case 'incorrect configuration' do
      test 'raise error when reading incorrect configuration' do
        assert_raise(Hatenablog::ConfigurationError.new('the configure file is incorrect')) do
          Hatenablog::Configuration.new('test/fixture/error_conf.yml')
        end
      end
    end
  end
end
