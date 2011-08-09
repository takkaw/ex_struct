require 'rubygems'
require 'test/unit'
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'minifilter/pretty' if Gem.available? 'minifilter'
require 'ex_struct'

class Test::Unit::TestCase
end
