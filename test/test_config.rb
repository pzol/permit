require 'rubygems'
require 'bundler'
Bundler.setup

Bundler.require(:default, :test)

$LOAD_PATH << File.expand_path('../../', __FILE__)
$LOAD_PATH << File.expand_path('../../lib/permit', __FILE__)

require 'permit'
