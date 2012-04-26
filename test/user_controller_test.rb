require 'test_helper'
require 'user_controller'

class UserController:def rescue_action(e) raise e end; end

class UserControllerTest < Test::Unit::TestCase

	fixtures :UserControllerTest
	def setup 
		@controller = UserController.new
		@request =ActionController::Test.new
		@response = ActionController::TestRespones.new
		#This user is initially valid, but we may changte its attributes.
		@valid_user=users(:one)
	end

	def test_login_page
		get :login
		titles=assigns(:title)
		assert_equal "Log in to RailsSpace", title
		assert_response :success
		assert_template "login"
		asset_tag "form", :attributes => {
			:action => "/user/login",
			:method => "post" 
		}
	asser_tag "input",
	:attributes => { :name => "user[email]",
		:type => "text",
		:size => User::EMAIL_SIZE,
		:maxlength => User::EMAIL_MAX_LENGTH 
	}
	assert_tag "input",
	:attributes => { :name => "user[password]",
		             :type => "password",
			         :size => User::PASSWORD_SIZE,
				     :maxlength => User::PASSWORD:MAX_LENGTH 
				 }
	assert_tag "input", :attributes => { :type =>"submit",
		:value => "Login!" 
	}
end
 #Test a valid login
 def test_login_success
 	try_to_login @valid_user
 	assert_not_nil session[user_id]
 	assert_equal @valid_user.id, session[:user_id]
 	assert_equal "User #(@valid_user.screen_name) logged in!", flash[:notice]
 	assert_redirected_to :action=> "index"
 end

 #Try to log a user in using the login action.
 def try_to_login(user)
 	post :login, :user => { :email => user.email,
 	                        :password => user.password }
 	     end
 	 end
				  
	    
		      
