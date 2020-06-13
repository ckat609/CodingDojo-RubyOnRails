require 'rails_helper'

feature "logs in an existing user" do
    before(:each) do
        User.create(fname: "Armando", lname: "Tello", email: "a@a.com", password: "helloworld")
        visit users_new_path
    end
    
    scenario "should be able to log in with all valid params" do
        fill_in "login_email", with: "a@a.com"
        fill_in "login_password", with: "helloworld"
        click_button "Sign in"
        expect(page).to have_content "Welcome, Armando"
    end
    
    scenario "should not be able to sign in with blank email" do
        fill_in "login_email", with: ""
        fill_in "login_password", with: "helloworld"
        click_button "Sign in"
        expect(page).to have_content "Email doesn't exist in our records"
    end
    
    scenario "should not be able to sign in with incorrect password" do
        fill_in "login_email", with: "a@a.com"
        fill_in "login_password", with: "incorrectpw"
        click_button "Sign in"
        expect(page).to have_content "Incorrect password"
    end
    
    scenario "should not be able to sign in with non existent email" do
        # fill_in "login_email", with: "a@a.com"
        # fill_in "login_password", with: "helloworld"
        fill_in "login_email", with: "nonexisten@.com"
        fill_in "login_password", with: "incorrectpw"
        click_button "Sign in"
        expect(page).to have_content "Email doesn't exist in our records"
    end
end

