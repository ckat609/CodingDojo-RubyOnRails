require 'rails_helper'

feature "authentication feature" do
    feature "login page" do
        before(:each) do
            visit sessions_new_path
        end

        scenario 'visits sign-in page, prompted with email and password fields' do
            expect(page).to have_field 'user_email'
            expect(page).to have_field 'user_password'
        end


        scenario 'logs in user if email/password combination is valid' do
            add_user
            fill_in "user_email", with: 'a@a.com'
            fill_in "user_password", with: 'hello'
            click_button "Sign in"
            expect(page).to have_text "Welcome, Armando Tello"
        end
        
        scenario 'does not sign in user if email is not found' do
            add_user
            fill_in "user_email", with: 'b@b.com'
            fill_in "user_password", with: "hello"    
            click_button "Sign in"
            expect(page).to have_text "Invalid email"
        end
        
        scenario 'does not sign in user if email is not found' do
            add_user
            fill_in "user_email", with: 'a@a.com'
            fill_in "user_password", with: "helloworld"
            click_button "Sign in"
            expect(page).to have_text "Invalid password"
        end


        scenario "check for logout button" do
            login
            expect(page).to have_text "Logout"    
        end


        scenario "check for logout button" do
            login
            expect(page).to have_text "Logout"
            click_link "Logout"
            expect(current_path).to eq('/sessions/new')
        end
    end

end

def add_user
    User.create(name: "Armando Tello", email: "a@a.com", password: "hello", password_confirmation: "hello")
end

def login
    add_user
    fill_in "user_email", with: 'a@a.com'
    fill_in "user_password", with: "hello"
    click_button "Sign in"
end