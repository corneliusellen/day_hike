require 'rails_helper'

describe "As a Visitor" do
  describe "when I visit the trips index" do
    describe "I click on trip show" do
      trip = Trip.create(name: "Girls Trip")
      trail_1 = Trail.create(name: "Larkspur", address: "RMNP", length: 2)
      trail_2 = Trail.create(name: "Larkspur", address: "RMNP", length: 5)
      trip.trails << [trail_1, trail_2]

      it "I see a list of trails included in the trip and trail name, address and length" do
        visit trips_path
        within("#number#{trip.id}") do
          click_on "View Trip"
        end

        expect(current_path).to eq(trip_path(trip))
        expect(page).to have_content(trail_1.name)
        expect(page).to have_content(trail_1.address)
        expect(page).to have_content(trail_1.length)
        expect(page).to have_content(trail_2.name)
        expect(page).to have_content(trail_2.address)
        expect(page).to have_content(trail_2.length)
      end

      it "I see the planned total hiking distance" do
        visit trip_path(trip)
        expect(page).to have_content("Total Distance: 7")
        expect(page).to have_content("Average Distance: 3.5")
        expect(page).to have_content("Longest Distance: 5")
      end
    end
  end
end
