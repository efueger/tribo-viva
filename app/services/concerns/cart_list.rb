module CartList
  extend ActiveSupport::Concern

  CartListItem = Struct.new(:offer, :total_price, :piece_price, :quantity)

  def cart_list
    @cart_list ||= cart.map do |item|
      offer = offers.detect{ |_offer| _offer.id == item['id'] }
      remove(item['id'], item['quantity'].to_i) && next if offer.nil?

      piece = offer.value + offer.coordinator_tax + offer.operational_tax
      CartListItem.new(offer, piece * item['quantity'], piece, item['quantity'])
    end.compact
  end

  def sub_total
    cart_list.map(&:total_price).sum
  end

  def total_card_fee
    if items_count > 0
      ((sub_total * 0.04715) + 0.3).round(2)
    else
      0
    end
  end

  def total_bank_slip_fee
    2.5
  end

  def total_value
    sub_total + total_card_fee
  end

  private

  def offers
    @offers ||= Offer.where(id: offer_ids).select(offer_attributes)
  end

  def offer_attributes
    %i(id value coordinator_tax operational_tax title image offer_ends_at)
  end

  def offer_ids
    cart.map{ |item| item['id'] }
  end
end
