require "rails_helper"

RSpec.describe "Pages", type: :request do 
	
	describe "User Not Signed In" do
	  it "returns a successful response" do
	    get root_path 
	    expect(response).to be_successful
	  end

	  it "shows the home page" do 
	  	get root_path 
	  	expect(response.body).to include("Home")
	  end
  end
end