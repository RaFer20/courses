require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @title = "Dynamic Directory Index"
  @file_list = "List of Files"
  
  @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort
  @files.reverse! if params[:sort] == "desc"


  erb :index
end