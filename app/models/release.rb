class Release < ApplicationRecord

    def has_listings?
        listings = DiscogsScraper.search_listings self
        has_some = listings.empty?
        if has_some
            self.listings_count = listings.count
            self.save!
            return true
        else
            return false
        end
    end
end
