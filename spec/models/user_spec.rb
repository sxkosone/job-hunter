require 'spec_helper'

describe "User" do
    
    before do
        password = "pass"
        @user = User.create(name: "Ricky Rspek", username: "ricky1234", password: password)
        @job = Job.create(description: "blahblah", position: "Cook")
        @job_application = JobApplication.create(user: @user, job: @job)
    end

        it "has a name" do
            expect(@user.name).to eq("Ricky Rspek")
        end
        
end