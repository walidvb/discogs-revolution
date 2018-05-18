class NotifierMailer < ApplicationMailer

    def deliver_notify release
    end
    
    def notify release
        @release = release
        mail to: 'privatvincent+discogs_revo@gmail.com'
    end
end
