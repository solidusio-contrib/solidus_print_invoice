require 'spec_helper'

RSpec.feature "Print Invoice button", js: true do
  given!(:order) { FactoryGirl.create(:completed_order_with_totals) }
  given(:user) { FactoryGirl.create(:admin_user, password: "boxen1011") }

  scenario "it displays a print invoice button on order pages" do
    visit spree.admin_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "boxen1011"
    click_button "Login"

    click_link order.number

    within(".page-actions") do
      print_button = find("a", text: /Print Invoice/i)
      expect(URI(print_button[:href]).path).to eql(spree.admin_order_path(order, :pdf))
    end
  end
end
