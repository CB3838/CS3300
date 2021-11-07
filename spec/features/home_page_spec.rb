require "rails_helper"

# tell rspec we are testing a feature (simulating the user visiting the homepage of the site)
RSpec.feature "Visiting the homepage", type: :feature do

  #create a test case to see weather projects are displayed on homepage
  scenario "The visitor should see projects" do

    #simulate the user going to the root_path (the homepage is always at the root)
    visit root_path

    #test passes if test "Projects" exists on the homepage
    expect(page).to have_text("Projects")
  end
end