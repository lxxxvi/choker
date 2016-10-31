require 'test_helper'

class Choker::VersionTest < Minitest::Test
  def test_version
    assert_equal '0.0.0', Choker::VERSION
  end
end
