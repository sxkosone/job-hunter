require 'rails_helper'

describe 'users', type: 'feature' do
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

        it 'can create a new user' do 
            click_button('Sign up')
            expect(page).to have_content('Jared Chamberlain')
        end

        it "doesn't create user if password is different than password confirmation" do 
            fill_in('user_password_confirmation', :with => 'p')
            click_button('Sign up')
            #expect(page).to have_content("Password confirmation doesn't match Password")
            expect(page).to have_content("Login Signup")
        end 

        it "Doesn't allow a user with the same username" do 
            User.create(name:"Jared Chamberlain",username:"jarchamberlain",profession:"Rails Developer",city:"Washington, DC",password:"password",password_confirmation:"password")
            click_button('Sign up')
            expect(page).to have_content("Login Signup")
        end

          it "Doesn't allow a user with the same username with different case" do 
            User.create(name:"Jared Chamberlain",username:"Jarchamberlain",profession:"Rails Developer",city:"Washington, DC",password:"password",password_confirmation:"password")
            click_button('Sign up')
            expect(page).to have_content("Login Signup")
        end

    end

    describe 'signout' do 
        before :each do 
            User.create(name:"Jared Chamberlain",username:"jarchamberlain",profession:"Rails Developer",city:"Washington, DC",password:"password",password_confirmation:"password")
            visit login_path
            fill_in('username', :with => 'jarchamberlain')
            fill_in('password', :with => 'password')
            click_button('Log in')
        end 

        it 'can log the user out' do
            click_link('Logout')
            visit jobs_path
            expect(page).to have_content("You must log in or sign up to use our awesome app.")
        end
    end 
end