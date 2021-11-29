require "rails_helper"

#we are declaring tests for ProjectsController (the controller in the MVC framework)
RSpec.describe ProjectsController, type: :controller do

  #test that the controller index method can be sucessfully called using HTTP get
  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end
  end


  #test the show method in the project controller, called over http
  context "GET #show" do

    #create a basic test project
    let!(:project) { Project.create(title: "Test title", description: "Test description") }

    #call show method over http with parameter id equal to the dummy project we just created
    # (so we are trying to show that test project)
    it "returns a success response" do
      get :show, params: { id: project }

      #test passes if the controller responds with a success
      expect(response).to be_success
    end
  end
end