# frozen_string_literal: true

require 'spec_helper'

RSpec.describe "Print Invoice button", js: true do
  let!(:order) { FactoryBot.create(:completed_order_with_totals) }
  let(:user) { FactoryBot.create(:admin_user, password: "boxen1011") }

  it "displays a print invoice button on order pages" do
    visit spree.admin_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "boxen1011"
    click_button "Login"

    click_link order.number

    expect(page).to have_link('Print Invoice', href: spree.admin_order_path(order, :pdf, template: 'invoice'))
  end
end
