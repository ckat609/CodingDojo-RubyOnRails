require 'rails_helper'

feature "adds new message" do
    before(:each) do
        User.create(fname: "Armando", lname: "Tello", email: "a@a.com", password: "helloworld")
        visit users_new_path
        fill_in "login_email", with: "a@a.com"
        fill_in "login_password", with: "helloworld"
        click_button "Sign in"
    end
    
    scenario "if all fields are valid" do
        fill_in "message_message", with: "A message has been added"
        click_button "Create message"
        expect(page).to have_content "A message has been added"
    end
    
    scenario "if fields are invalid" do
        fill_in "message_message", with: "Short"
        click_button "Create message"
        expect(page).to have_content "Message is too short (minimum is 10 characters)"
    end
end