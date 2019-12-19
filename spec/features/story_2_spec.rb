require 'rails_helper'

describe "User Story 2:" do
  it "vending machine show page show average price for snacks" do
    jomah = Owner.create(name: "Jomah")
    turing = Machine.create(location: "Turing", owner: jomah)
    mm = Snack.create(name: "M&Ms", price: 1_00)
    sunchips = Snack.create(name: "Sunchips", price: 1_25)
    jerky = Snack.create(name: "Jack Links", price: 1_75)
    turing.snacks << [mm, sunchips, jerky]

    visit machine_path(turing.id)
    expect(page).to have_content 133
  end
end