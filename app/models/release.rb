class Release < ApplicationRecord

    scope :unlisted, ->{where(listings_count: 0)}

    def has_new_listing?
        listings = DiscogsScraper.search_listings self
        self.listings_count = listings.count
        self.save!
        return self.listings_count  > 0
    end

    def notify_new_listing!
        NotifierMailer.notify(self).deliver_now
    end
end
