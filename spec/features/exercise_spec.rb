require 'rails_helper'

RSpec.feature "Creating exercise" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario "with valid inputs"  do
    fillout_new_workout_with(70, "Weight lifting", "2015-08-07")

    expect(page).to have_content("Exercise has been created")
    expect(page.current_path).to eq(user_exercise_path(@john,Exercise.last))
  end

  scenario "with invalid inputs" do
    fillout_new_workout_with(nil, "", "")

    expect(page).to have_content("Exercise has not been created")
    expect(page).to have_content("Duration in min can't be blank")
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout can't be blank")
    expect(page).to have_content("Workout date can't be blank")
  end

  def fillout_new_workout_with(duration, details, date)
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: duration
    fill_in "Workout Details", with: details
    fill_in "Activity Date", with: date
    click_button "Create Exercise"
  end
end