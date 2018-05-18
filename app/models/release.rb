class Release < ApplicationRecord
    before_save :get_details

    validates_uniqueness_of :release_id
    
    scope :unlisted, ->{where(listings_count: 0)}

    def index
        @releases = Release.all.order('lowest_price DESC')
    end

    def has_new_listing?
        listings = DiscogsScraper.search_listings self
        self.listings_count = listings.count
        self.save!
        return self.listings_count  > 0
    end

    def get_details
        begin
            details = DiscogsScraper.get_details self.release_id
            self.artist = details['artists'][0]['name'] if !details['artists'].empty?
            self.title = details['title']
            self.lowest_price = details['lowest_price']
            self.listings_count = details['num_for_sale']
        rescue => e
        end
    end
end
