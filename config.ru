root = File.dirname(__FILE__)

$:.unshift File.expand_path("../renee/lib", root)
$: << root

require 'renee'
require 'json'
require 'models'

run Renee {

  get do
    render! 'index'
  end

  mount! :posts, PostResource

}.setup {
  use Rack::Lint
  use Rack::MethodOverride
  use Rack::Static, :urls => ['/css', '/img', '/js'], :root => 'public'
  
  views_path File.expand_path(File.dirname(__FILE__) + "/views")
}
