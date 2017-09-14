require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    machine  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = machine.snacks.create(name: "cheetos", price: 2.00)
    snack2 = machine.snacks.create(name: "twizzlers", price: 1.00)

    visit machine_path(machine)

    expect(page).to have_content("cheetos")
    expect(page).to have_content("2")
    expect(page).to have_content("1.5")
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
end
