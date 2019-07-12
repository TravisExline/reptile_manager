require_relative './config/environment'

use Rack::MethodOverride
use PostsController
use ReptilePostController
use UsersController
run ApplicationController
