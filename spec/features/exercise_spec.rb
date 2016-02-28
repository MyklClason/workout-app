require 'rails_helper'

RSpec.feature "Creating exercise" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario  do
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"

    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Weight lifting"
    fill_in "Activity Date", with: "2015-08-07"
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")
    expect(page.current_path).to eq(user_exercise_path(@john,Exercise.last))
  end
end