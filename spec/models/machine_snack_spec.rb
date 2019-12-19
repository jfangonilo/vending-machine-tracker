require 'rails_helper'

describe MachineSnack do
  it {should belong_to :machine}
  it {should belong_to :snack}
end