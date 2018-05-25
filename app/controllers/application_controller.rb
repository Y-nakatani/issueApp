class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
   render html: "hello, world!"
 end
end

#class mainpage < ActionController::Base
#  protect_from_forgery with: :exception
#  def index
#    render html: "イエエエ"
#  end
#end
