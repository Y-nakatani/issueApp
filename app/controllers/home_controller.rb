class HomeController < ActionController::Base
  #protect_from_forgery with: :exception
  def index
    #@attendance = Attendance.all
    @courses = Course.all
 end
 def allcourse
   @course = Course.all
   #drop_colum :course
   #remove_column(:course, :course_id, :course_title, :topic, :day_length, :price, :level_id, :category)
   #@delete = Delete.destroy
 end
 def newcourse
   @courseID = params[:courseID]
   @courseTitle = params[:courseTitle]
   @courseTopic = params[:courseTopic]
   @courseDaylength = params[:courseDaylength]
   @coursePrice = params[:coursePrice]
   @courselevelID = params[:courselevelID]
   @courseCategory = params[:courseCategory]
 end
end

#class DatebaseController < ActionController::Base
  #def listall
  #  @training_db= Training_db.all
 #end
#end
