require 'rails_helper'


# We are testing (from a user's perspective) that they can sucessfully
# create, update and remove projects using the UI
RSpec.feature "Projects", type: :feature do

  #create a group of tests for creating a new project
  context "Create new project" do
    before(:each) do

      user = FactoryBot.create (:user)
      login_as(user)

      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  #create a group of tests for updating (editing) a project
  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do

      user = FactoryBot.create (:user)
        login_as(user)
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  #create a group of tests for deleting a project
  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do

      user = FactoryBot.create (:user)
      login_as(user)
      visit projects_path
      click_link "Remove"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end