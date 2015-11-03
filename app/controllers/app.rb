require 'tilt/erb'
require_relative '../../lib/string/calculate'
require_relative '../../lib/numeric/percentage'

class App < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  set :public_folder, "public/assets"

  get '/' do
    erb :index
  end

  post '/calculate' do
    factor = params['factor']
    result = factor.gsub(/%+|√+/, '').calculate

    result = result.percentage if factor[/\d%/]
    result = result.sqrt       if factor[/√\d/]
    result = (result.to_f == result.to_i) ? result.to_i : result.to_f.round(9)

    result.to_s
  end

end

# teste 6/12 == 0,5
# teste sqrt
# 312.3x1
# teste percentage