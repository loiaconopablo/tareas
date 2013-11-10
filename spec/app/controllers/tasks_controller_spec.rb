require 'spec_helper'

describe "TasksController" do

	describe 'get :register' do
		
	  it "should response ok" do
	  	TaskManagement::App.any_instance.should_receive(:render).with('users/new')
	  	get '/register'
	    last_response.should be_ok
	  end

	  it 'should render users/new' do
	  	TaskManagement::App.any_instance.should_receive(:render).with('users/new')
	  	get '/register'
	  end

	 end
	 
end