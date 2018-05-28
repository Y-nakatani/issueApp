class HomeController < ActionController::Base
  #protect_from_forgery with: :exception
  def index
    @attendance = Attendance.all
    @course = Course.all
 end
end

#class DatebaseController < ActionController::Base
  #def listall
  #  @training_db= Training_db.all
 #end
#end
