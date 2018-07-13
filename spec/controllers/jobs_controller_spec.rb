require 'rails_helper'

RSpec.describe JobsController do
    before do
        password = "pass"
        @user = User.create(name: "Ricky Rspek", username: "ricky1234", password: password)
    end

    describe 'get index' do
        it "should redirect to login if you're not logged in" do
        get :index
        expect(response).to redirect_to controller: 'static', action: 'home'
        end
    end

    describe 'logged_in_user' do
        it 'returns nil if nobody is logged in' do
            expect(subject.logged_in_user).to be nil
        end

        it "returns username for logged in users" do
            user = User.first
            @request.session[:user_id] = user.id
            expect(subject.logged_in_user).to eq user.username
        end
    end

    
end
