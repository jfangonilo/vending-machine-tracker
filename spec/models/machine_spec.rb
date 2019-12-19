require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe 'relationships' do
    it {should have_many :machine_snacks }
    it {should have_many(:snacks).through(:machine_snacks)}
  end

  describe 'methods' do
    it "average snack price" do
      jomah = Owner.create(name: "Jomah")
      turing = Machine.create(location: "Turing", owner: jomah)
      mm = Snack.create(name: "M&Ms", price: 1_00)
      sunchips = Snack.create(name: "Sunchips", price: 1_25)
      jerky = Snack.create(name: "Jack Links", price: 1_75)
      turing.snacks << [mm, sunchips, jerky]

      expect(turing.average_snack_price).to be_between(133, 134)
    end
  end
end
