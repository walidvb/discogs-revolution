module Blower
    def self.send_sms message
        url = ENV['BLOWERIO_URL']
        blowerio = RestClient::Resource.new(url)
        begin
            blowerio['/messages'].post :to => '+33676952934‬', :message => message
        rescue => e
            puts "Error posting sms #{e}"
        end
    end
end