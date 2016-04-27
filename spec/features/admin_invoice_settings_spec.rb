require 'spec_helper'

RSpec.feature "Print Invoice Settings", js: true do
  given!(:order) { FactoryGirl.create(:completed_order_with_totals) }
  given(:user) { FactoryGirl.create(:admin_user, password: "boxen1011") }

  scenario "It allows for the update of print invoice settings" do
    visit spree.admin_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "boxen1011"
    click_button "Login"

    click_link "Settings"
    click_link "General"

    select "Times Roman", from: "print_invoice_font_face"
    fill_in "print_invoice_next_number", with: "150"
    fill_in "print_invoice_logo_scale", with: "60"

    click_button "Update"
    visit current_path

    expect(find("#print_invoice_font_face").value).to eql("Times-Roman")
    expect(find("#print_invoice_next_number").value).to eql("150")
    expect(find("#print_invoice_logo_scale").value).to eql("60")
  end
end
