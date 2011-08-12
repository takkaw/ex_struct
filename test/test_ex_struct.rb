require 'helper'

class TestExStruct < Test::Unit::TestCase
  should "initialize with hash" do
    conf = ExStruct.new(:x => {:y => 100})
    assert_equal conf.x.y,100
  end
  should "add new method as value = 100" do
    conf = ExStruct.new
    conf.value = 100
    conf.foo.value = 200
    assert_equal conf.value,100
  end
  should "touch new method" do
    conf = ExStruct.new
    conf.test
    assert ExStruct === conf.test
  end
  should "add new multiple method" do
    conf = ExStruct.new
    conf.foo.bar.baz = "ok"
    assert_equal conf.foo.bar.baz ,"ok"
  end
  should "not yet touch method is nil" do
    conf = ExStruct.new
    assert_equal conf.not_yet? , nil
  end
  should "raise ArgumentError" do
    conf = ExStruct.new
    assert_raise(ArgumentError) {
      conf[1,2,3] = :test
    }
    assert_raise(ArgumentError) {
      conf.test? :foo,:bar
    }
    assert_raise(ArgumentError){
      conf.test :foo
    }
  end
end

