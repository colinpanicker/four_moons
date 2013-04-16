require 'spec_helper'
    describe "Static pages" do
    	subject {page}
        describe "Login page" do
        	before {visit root_path}
            it { should have_selector('title', :text =>'Four Moons') }
        end
     
     describe "for signed-in users" do
       let(:user) { FactoryGirl.create(:user) }
       before do
         FactoryGirl.create(:question, user: user, content: "Lorem" , stream_id: "1")
         FactoryGirl.create(:question, user: user, content: "Ipsum", stream_id: "1")
         sign_in user
         visit root_path
       end
      it "should render the user's feed" do
         user.feed.each do |item|
         page.should have_selector("li##{item.id}", text: item.content)
        end
     end

        describe "follower/following counts" do
         let(:other_user) { FactoryGirl.create(:user) }
          before do
          other_user.follow!(user)
          visit root_path
          end
          it { should have_link("0 following", href: following_user_path(user)) }
          it { should have_link("1 follower", href: followers_user_path(user)) }
        end

    end
 end

