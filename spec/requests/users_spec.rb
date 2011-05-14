require 'spec_helper'

describe "Users" do
  
  describe "Signup" do
    
    describe "failure" do
      
      it "should not make new user with wrong datas" do
        lambda do
          visit signup_path
          fill_in "Name",  :with => ''
          fill_in "Email", :with => ''
          fill_in "Password",     :with => ''
          fill_in "Confirmation", :with => ''
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
    end
    
    describe "success" do
      
      it "should make a new user from correct datas" do
        lambda do
          visit signup_path
          fill_in "Name",  :with => 'Test name'
          fill_in "Email", :with => 'Example@test.mail'
          fill_in "Password",     :with => 'Foobar'
          fill_in "Confirmation", :with => 'Foobar'
          click_button
          response.should have_selector("div.flash.success",
                                                  :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
  end
end
