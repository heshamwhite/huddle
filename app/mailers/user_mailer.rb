class UserMailer < ApplicationMailer
	default from: 'huddleos@gmail.com'
 
  def welcome_email(user)
    @user = user
    @mystring= (0...60).map { (65 + rand(26)).chr }.join
    @confirm= Confirm.new(user_id: @user.id, confirmtext:@mystring)   
    @confirm.save
    #@url  = "http://localhost:3000/users?id=#{@user.id}/confirm?mystring= #{@mystring}"
    @url  = "http://localhost:3000/users/confirm?confkey=#{@mystring}"

    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
