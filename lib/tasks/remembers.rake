namespace :remember do
  desc 'Remember producers of tommorows delivers'
  task producers: :environment do
    offers = Offer.where(collect_starts_at: Date.tomorrow.beginning_of_day..Date.tomorrow.end_of_day)
    offers.group_by(&:producer).each do |producer, _offers|
      valid_offers = _offers.select{ |offer| offer.remaining.zero? }
      Remembers.producer(producer, valid_offers).deliver_now if valid_offers.size > 0
    end
  end

  desc 'Remember coordinators of deliveries'
  task coordinators: :environment do
    offers = Offer.where(collect_starts_at: Date.today.beginning_of_day..Date.today.end_of_day)
    offers.find_each do |offer|
      if offer.remaining.zero?
        Remembers.deliver_coordinator(offer).deliver_now
      end
    end
  end

  desc 'Remember buyers of offers'
  task buyers: :environment do
    offers = Offer.where(collect_starts_at: Date.today.beginning_of_day..Date.today.end_of_day)
    offers.find_each do |offer|
      if offer.remaining.zero?
        offer.purchases.by_status(PurchaseStatus::PAID).each do |purchase|
          Remembers.buyer(purchase.user, offer).deliver_now
        end
      end
    end
  end
end
