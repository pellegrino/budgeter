require 'spec_helper'


feature "Creating transactions", %q{
  To track where is my money going
  As a user
  I want to inform transactions  
} do 

  scenario "new expense" do
    visit transactions_path 

    within("form") do
      fill_in "Name", with: "Cable monthly fee"
      fill_in "Amount" , with: "10.00" 
      click_button  "Save"
    end 

    page.should have_content "Transaction created successfully"
    within("#transactions") do
      page.should have_content "Cable monthly fee"
      page.should have_content "$10.00"
    end 
  end 
end 
