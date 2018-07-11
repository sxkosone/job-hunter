require 'spec_helper'

describe "User" do
    before do
        @user = User.create(name: "Ricky Rspek", username: 'CoolGuy5')
    end

    describe "User" do
        it "has a name" do
            expect(@user.name).to eq("Ricky Rspek")
        end
    end
end