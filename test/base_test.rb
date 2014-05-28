require_relative './test_helper'

class BaseTest < MiniTest::Unit::TestCase

  def test_base62_consistency
    assert_equal Hashstand.hash('abc', base: 62), Hashstand.hash('abc', base: 62)
    assert_equal Hashstand.hash('abc', base: 62, salt: 'xyz'), Hashstand.hash('abc', base: 62, salt: 'xyz')
  end

  def test_base62_uniqueness
    refute_equal Hashstand.hash('abc', base: 62), Hashstand.hash('def', base: 62)
    refute_equal Hashstand.hash('abc', base: 62, salt: 'xyz'), Hashstand.hash('abc', base: 62, salt: 'def')
  end

  def test_size_range
    assert Hashstand.hash('*', base: 62).length > 30, 'size was wrong'
    assert Hashstand.hash('*'*1000000, base: 62).length > 30, 'size was wrong'
  end

end
