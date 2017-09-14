require 'rails_helper'


feature "user" do
   scenario "visits snack page and sees analytics" do
     sam = Owner.create(name: "Sam's Snacks")
     machine = sam.machines.create(location: "Don's Mixed Drinks")

     snack1 = machine.snacks.create(name: "cheetos", price: 2.00)
     snack2 = machine.snacks.create(name: "twizzlers", price: 1.00)

     visit snack_path(snack1)

     expect(page).to have_content("cheetos")
     expect(page).to have_content("2")
     expect(page).to have_content("Don's Mixed Drinks")
     expect(page).to have_content("1.5")
     expect(page).to have_content("2 different snacks")
  end
end
