class UserController < ApplicationController
#before_filter :save_login_state, :only => [:new, :create]
def new
    @user = User.new 
    render 'new'
  end
def create
  @user = User.new(user_params)
  if @user.save
    flash[:notice] = "You signed up successfully"
    flash[:color]= "valid"
    session[:user_id]=@user.id
    redirect_to :controller=> 'pages', :action => 'home'
  else
    flash[:notice] = "Form is invalid"
    flash[:color]= "invalid"
    render 'new'
  end
  
end
def user_params
  params.require(:user).permit(:name, :email, :password, :salt, :encrypted_password, :degree, :year)
end

end
