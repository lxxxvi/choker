class ChokerTest::General::Version < ChokerTest::General
  def test_version
    assert_equal '0.0.0', Choker::VERSION
  end
end
