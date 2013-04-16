require 'spec_helper'

describe Question do


  let(:user) { FactoryGirl.create(:user) }
  
  let(:stream) {FactoryGirl.create(:stream) }

  before { @question = user.questions.build(content: "Lorem ipsum",stream_id: stream.stream_id) }
subject { @question }
it { should respond_to(:content) }
it { should respond_to(:user_id) }
it { should respond_to(:user) }
it { should respond_to(:stream_id)}
its(:user) { should == user }
it { should be_valid }
     
     describe "when user id is not present" do
         before { @question.user_id = nil }
        it { should_not be_valid }
      end


describe "accessible attributes" do
    it "should not allow access to user id" do
      expect do
         Question.new(user_id: user.id)
          end.should raise_error(ActiveModel::MassAssignmentSecurity::Error) 
       end
   end


end
