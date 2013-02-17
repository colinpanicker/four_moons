require 'spec_helper'
    describe "Static pages" do
    	subject {page}
        describe "Login page" do
        	before {visit root_path}
            it { should have_selector('title', :text =>'Four Moons Login') }
        end
    end


