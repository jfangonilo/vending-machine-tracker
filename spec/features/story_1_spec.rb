require 'rails_helper'

describe "User Story 1:" do
  it "vending machine show page shows the name of snacks and their prices" do
    jomah = Owner.create(name: "Jomah")
    turing = Machine.create(location: "Turing", owner: jomah)
    mm = Snack.create(name: "M&Ms", price: 1_00)
    sunchips = Snack.create(name: "Sunchips", price: 1_25)
    jerky = Snack.create(name: "Jack Links", price: 1_75)
    turing.snacks << [mm, sunchips, jerky]

    visit "/machines/#{turing.id}"
    within "#snack-#{mm.id}" do
      expect(page).to have_content mm.name
      expect(page).to have_content mm.price
    end

    within "#snack-#{sunchips.id}" do
      expect(page).to have_content sunchips.name
      expect(page).to have_content sunchips.price
    end

    within "#snack-#{jerky.id}" do
      expect(page).to have_content jerky.name
      expect(page).to have_content jerky.price
    end
  end
end