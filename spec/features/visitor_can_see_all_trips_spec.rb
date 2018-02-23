require 'rails_helper'

describe "As a Visitor" do
  describe "when I visit the trips index" do
    describe "I click on trip show" do
      it "I see a list of trails included in the trip and trail name, address and length" do
        trip = Trip.create(name: "Girls Trip")
        trail_1 = Trail.create(name: "Larkspur", address: "RMNP", length: 2)
        trail_2 = Trail.create(name: "Larkspur", address: "RMNP", length: 2)
        trip.trails << [trail_1, trail_2]

        visit trips_path
        click_on "View Trip"

        expect(current_path).to eq(trip_path(trip))
        expect(page).to have_content(trail_1.name)
        expect(page).to have_content(trail_1.address)
        expect(page).to have_content(trail_1.length)
        expect(page).to have_content(trail_2.name)
        expect(page).to have_content(trail_2.address)
        expect(page).to have_content(trail_2.length)
      end
    end
  end
end
