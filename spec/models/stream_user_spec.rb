require 'spec_helper'

describe StreamUser do
  let(:stream_follower) { FactoryGirl.create(:user) }
  let(:stream) { FactoryGirl.create(:stream) }
  let(:stream_user) { stream_follower.stream_users.build(stream_id: stream.stream_id) }

    subject { stream_user }
      it { should be_valid }
       
       describe "accessible attributes" do
        it "should not allow access to user id" do
        expect do
        	StreamUser.new(user_id: stream_follower.id)
             end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
        end
      end

      describe "stream follower methods" do
         it { should respond_to(:user) }
         it { should respond_to(:stream) }
         its(:user) { should == stream_follower }
         its(:stream) { should == stream }
      end

      describe "when stream id is not present" do
          before { stream_user.stream_id = nil }
           it { should_not be_valid }
      end

      describe "when user id is not present" do
          before { stream_user.user_id = nil }
          it { should_not be_valid }
      end




end
