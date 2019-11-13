# frozen_string_literal: true

require 'spec_helper'

RSpec.describe "Order Invoice Generation" do
  before do
    ActionController::Base.allow_forgery_protection = false
  end

  after do
    ActionController::Base.allow_forgery_protection = true
  end

  describe "GET show" do
    let(:order) { FactoryBot.create(:completed_order_with_totals) }
    let(:user) { FactoryBot.create(:admin_user, password: "testing123") }
    let(:headers) { { "X-Spree-Token" => user.spree_api_key } }

    it "returns a pdf" do
      # The invoice generation feature is restricted to admins
      post(spree.login_path, params: { 'spree_user[email]' => user.email, 'spree_user[password]' => 'testing123' })
      get(spree.admin_order_path(order.number, :pdf))

      aggregate_failures "pdf response is successful" do
        expect(response).to be_successful
        expect(response.headers["Content-Type"]).to eql("application/pdf; charset=utf-8")
        expect(response.body).to start_with('%PDF')
      end
    end
  end
end
