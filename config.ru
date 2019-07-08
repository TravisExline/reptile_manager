require_relative './config/environment'

use Rack::MethodOverride
use PostsController
use SessionsController
use UserPageController
run ApplicationController
