require 'rails_helper'

RSpec.describe SessionsController do
    
    describe 'signup' do
        before :each do 
            visit new_user_path
            fill_in('user_name', :with => 'Jared Chamberlain')
            fill_in('user_username', :with => 'jarchamberlain')
            fill_in('user_profession', :with => 'Rails Developer')
            fill_in('user_city', :with => 'Washington, DC')
            fill_in('user_password', :with => 'password')
            fill_in('user_password_confirmation', :with => 'password')
        end 

        # it "doesn't create user if password is different than password confirmation" do 
        #     fill_in('user_password_confirmation', :with => 'p')
        #     click_button('Sign up')
        #     expect(flash[:notice]).to eq "Username and/or password incorrect"
        # end 

        # it "Doesn't allow a user with the same username" do 
        #     User.create(name:"Jared Chamberlain",username:"jarchamberlain",profession:"Rails Developer",city:"Washington, DC",password:"password",password_confirmation:"password")
        #     click_button('Sign up')
        #     expect(subject.request.flash[:notice]).to eq "Username has already been taken"
        # end
    end

end