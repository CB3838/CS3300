require "rails_helper"

#set up tests for the Project class (which is a model in the MVC framework)
RSpec.describe Project, type: :model do

  #within the testing of the project create a "context" (a section of tests that you can
  #give a label to)
  #these tests will ensure that the project constructor properly checks that the
  #description and title are valid and present
    context "validations tests" do
      it "ensures the title is present" do
        project = Project.new(description: "Content of the description")
        expect(project.valid?).to eq(false)
      end

      it "ensures the Description is present" do
        project = Project.new(title: "A Title")
        expect(project.valid?).to eq(false)
      end
  
      #make sure the project can be saved without issues
      it "should be able to save project" do
        project = Project.new(title: "Title", description: "Some description content goes here")
        expect(project.save).to eq(true)
      end
    end
  
    #declare another context that contains tests for the scope of the project class
    #(making sure that multiple projects can persist even when created without references)
    context "scopes tests" do

      #set the parameters for a generic project template
      let(:params) { { title: "Title", description: "some description" } }

      #use that template to create 3 projects
        before(:each) do
            Project.create(params)
            Project.create(params)
            Project.create(params)
          end
      
          #make sure all 3 projects were created properly 
          it "should return all projects" do
            expect(Project.count).to eq(3)
          end
      
    end

end
