# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Print Invoice button', js: true do
  stub_authorization!

  let(:user) { create(:admin_user, password: 'boxen1011') }
  let!(:order) { create(:completed_order_with_totals, user: user) }

  before do
    ActionController::Base.allow_forgery_protection = false
  end

  after do
    ActionController::Base.allow_forgery_protection = true
  end

  it 'displays a print invoice button on order pages' do
    visit spree.admin_path
    click_link order.number

    expect(page).to have_link(
      'Print Invoice',
      href: spree.admin_order_path(order, :pdf, template: 'invoice')
    )
  end
end
