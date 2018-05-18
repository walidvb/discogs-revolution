module Blower
    def self.send_sms message
        url = ENV['BLOWERIO_URL']
        blowerio = RestClient::Resource.new(url)
        blowerio['/messages'].post :to => '+33676952934‬', :message => message
    end
end