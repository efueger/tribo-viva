require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :image }
    it { should validate_presence_of :value }
    it { should validate_presence_of :stock }
    it { should validate_presence_of :producer }
    it { should validate_presence_of :bank_account }
    it { should validate_presence_of :offer_ends_at }
    it { should validate_presence_of :operational_tax }
    it { should validate_presence_of :coordinator_tax }
    it { should validate_presence_of :collect_ends_at }
    it { should validate_presence_of :offer_starts_at }
    it { should validate_presence_of :collect_starts_at }
    it { should validate_presence_of :deliver_coordinator }
    it { should validate_presence_of :products_description }
  end

  describe "relations" do
    it { should have_many :orders }
    it { should belong_to :producer }
    it { should belong_to :bank_account }
    it { should have_many :old_purchases }
    it { should belong_to :deliver_coordinator }
  end

  describe "scopes" do
    let(:valid) { Offer.make!(offer_ends_at: 1.day.from_now) }
    let(:invalid_date) { Offer.make!(offer_ends_at: 1.day.ago) }
    let(:invalid_stock) { Offer.make!(stock: 0) }

    context "#valid_offers" do
      it { expect(Offer.valid_offers).to eq [valid] }
      it { expect(Offer.valid_offers).not_to eq [invalid_stock, invalid_date] }
    end

    context "#finished_offers" do
      it { expect(Offer.finished_offers).to eq [invalid_stock, invalid_date] }
      it { expect(Offer.finished_offers).not_to eq [valid] }
    end
  end

  describe "methods" do
    describe "#remaining!" do
      it "show the remaining offers" do
        offer = Offer.make!
        stock_before = offer.stock

        3.times do
          OldPurchase.make!(:confirmed, offer: offer)
        end

        expect(offer.remaining).to eql(stock_before - 6)
      end
    end
  end
end
