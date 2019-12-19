require 'rails_helper'

describe "User Story 3" do
  it "shows all the things about the snack" do
    jomah = Owner.create(name: "Jomah")
    et = Machine.create(location: "Earth Treks", owner: jomah)
    turing = Machine.create(location: "Turing", owner: jomah)

    mm = Snack.create(name: "M&Ms", price: 1_00)
    sunchips = Snack.create(name: "Sunchips", price: 1_25)
    jerky = Snack.create(name: "Jack Links", price: 1_75)
    monster = Snack.create(name: "Monster", price: 2_50)

    et.snacks << [mm, sunchips, jerky, monster]
    turing.snacks << [sunchips, jerky]

    visit snack_path(jerky)

    expect(page).to have_content jerky.price

    within "#machine-#{et.id}" do
      expect(page).to have_content et.location
      expect(page).to have_content et.average_snack_price
      expect(page).to have_content et.snack_count
    end

    within "#machine-#{turing.id}" do
      expect(page).to have_content turing.location
      expect(page).to have_content turing.average_snack_price
      expect(page).to have_content turing.snack_count
    end
  end
end