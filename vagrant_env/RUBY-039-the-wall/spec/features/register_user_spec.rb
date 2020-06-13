require 'rails_helper'

feature "creates a new account" do
    before(:each) do
        visit users_new_path
    end

    scenario "should not save user with a blank first name" do
        # fill_in "user_fname", with: "Test"
        fill_in "user_lname", with: "User"
        fill_in "user_email", with: "test@user.com"
        fill_in "user_password", with: "helloworld"
        click_button "Create User"
        expect(page).to have_content "Fname can't be blank"
    end

    scenario "should not save user with a blank last name" do
        fill_in "user_fname", with: "Test"
        # fill_in "user_lname", with: "User"
        fill_in "user_email", with: "test@user.com"
        fill_in "user_password", with: "helloworld"
        click_button "Create User"
        expect(page).to have_content "Lname can't be blank"
    end

    scenario "should not save user with a blank email" do
        fill_in "user_fname", with: "Test"
        fill_in "user_lname", with: "User"
        # fill_in "user_email", with: "test@user.com"
        fill_in "user_password", with: "helloworld"
        click_button "Create User"
        expect(page).to have_content "Email can't be blank"
    end

    scenario "should not save user with a blank password" do
        fill_in "user_fname", with: "Test"
        fill_in "user_lname", with: "User"
        fill_in "user_email", with: "test@user.com"
        # fill_in "user_password", with: "helloworld"
        click_button "Create User"
        expect(page).to have_content "Password can't be blank"
    end

    scenario "should not save user if email already exists in database" do
        fill_in "user_fname", with: "Test 1"
        fill_in "user_lname", with: "User 2"
        fill_in "user_email", with: "a@a.com"
        fill_in "user_password", with: "helloworld"
        click_button "Create User"

        fill_in "user_fname", with: "Test 2"
        fill_in "user_lname", with: "User 2"
        fill_in "user_email", with: "a@a.com"
        fill_in "user_password", with: "helloworld"
        click_button "Create User"
        expect(page).to have_content "has already been taken"
    end
end