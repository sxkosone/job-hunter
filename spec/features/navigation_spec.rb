require 'rails_helper'

describe 'navigation', type: 'feature' do
    describe 'signup' do
        before :each do 
            User.create(name:"Jared Chamberlain",username:"jarchamberlain",profession:"Rails Developer",city:"Washington, DC",password:"password",password_confirmation:"password")
            visit login_path
            fill_in('username', :with => 'jarchamberlain')
            fill_in('password', :with => 'password')
            click_button('Log in')

        end 

        it 'can go to jobs page' do 
            click_link('Job Feed')
            expect(page).to have_content('View jobs in Washington, DC')
        end

        it 'can go to applications page' do 
            click_link('My Applications')
            expect(page).to have_content('My job applications')
        end

    end
end