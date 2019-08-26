require "rails_helper"

RSpec.describe "As a user", type: :feature do
  describe "Search Form" do
    it "I should see a list of the 10 closest stations within 6 miles sorted by distance" do
      visit "/"

      within (".navbar") do
        fill_in "q", with: 80203
        click_on "Locate"
      end

      expect(current_path).to eq("/search")

      expect(page).to have_css(".closest-stations", count: 10)

      within (first(".closest-stations")) do
        expect(page).to have_content("Name")
        expect(page).to have_content("Address")
        expect(page).to have_content("Fuel Types")
        expect(page).to have_content("Distance")
        expect(page).to have_content("Access Times")
      end
    end
  end
end
