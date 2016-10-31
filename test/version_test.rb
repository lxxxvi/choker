require 'test_helper'

module Choker
  class VersionTest < Minitest::Test
    def test_version
      assert_equal '0.0.0', Choker::VERSION
    end
  end
end
