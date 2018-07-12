require 'rails_helper'

RSpec.describe JobsController do

    describe 'get index' do
        it "should redirect to login if you're not logged in" do
        get :index
        expect(response).to redirect_to controller: 'static', action: 'home'
        end
    end
end