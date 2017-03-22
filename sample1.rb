require 'mini_magick'
require 'rubygems'
require 'sinatra'
require 'haml'

get "/" do
  haml :upload
end

post "/" do 
  File.open('uploads/' + params['myfile'][:filename], "w") do |f|
  	f.write(params['myfile'][:tempfile].read)
  	haml :success
  end
 
image = MiniMagick::Image.new('uploads/' + params['myfile'][:filename], "w") 
image.resize '300x300'
image.gravity 'center'
image.extent '300x300'

haml :success

end