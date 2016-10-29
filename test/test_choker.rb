require 'minitest/autorun'
require 'choker'

class ChokerTest < Minitest::Test
  def test_version
    assert_equal '0.0.0', Choker::VERSION
  end
end