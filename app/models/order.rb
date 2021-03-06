class Order < ActiveRecord::Base
  after_create :update_purchase_value

  belongs_to :offer
  belongs_to :purchase

  validates :offer, :quantity, :purchase, :offer_value, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0, less_than: 4 }

  def total
    offer_value * quantity
  end

  protected

  def update_purchase_value
    total = purchase.total + (offer_value*quantity)
    purchase.update_attributes(total: total)
  end
end
