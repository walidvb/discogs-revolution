module DiscogsScraper
    
    def self.search_listings release
        url = "https://www.discogs.com/sell/list?release_id=#{release.release_id}"
        res = HTTParty.get(url, headers: {'Authorization' => 'Discogs token=NZtzIGEbtLplwOuxnsLAiRrIhztnjJUdGTVJVAgQ', 'User-Agent' => 'DiscogsMarketAPI/1.0'})
        body = Nokogiri::HTML(res.body)
        items = self.processBody(body)
    end
    
    def self.get_details id
        res = HTTParty.get "https://api.discogs.com/releases/#{id}"
        JSON.parse(res.body)
    end

    def self.processBody doc
        items = []
        doc.css('.shortcut_navigable').each do |item_source|
            item = {}
            
            item[:title] = item_source.css(".item_description_title").text();
            item[:condition_sleeve] = item_source.css(".item_sleeve_condition").text();
            item[:condition_media] = item_source.css(".item_condition span")[2].text();
            item[:seller] = item_source.css(".seller_info a")[0].text();
            item[:ships_from] = item_source.css(".seller_info li")[2].text().gsub("Ships From:","");
            item[:price] = item_source.css(".price")[0].text();
            
            items << item
        end
        puts items
        items
    end
end