require 'spec_helper'

feature "Creating accounts", %q{
  To track where is my money going
  As a user
  I want to inform transactions  
} do 

  scenario "new account" do
    visit new_account_path 
    within("form") do
      fill_in "Name",             :with => "Joint Account"
      fill_in "Starting balance", :with => "100.00"

      click_button "Save"
    end 
    page.should have_content "Account created successfully"

  end 

end 
