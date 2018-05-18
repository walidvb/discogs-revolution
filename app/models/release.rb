class Release < ApplicationRecord

    def has_listings?
        listings = DiscogsScraper.search_listings self
        !listings.empty?
    end
end
