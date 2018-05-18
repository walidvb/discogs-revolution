require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

	every(1.minute, 'Checking releases') do
		notify_for_new_releases
	end

	def notify_for_new_releases
		unlisted = Release.unlisted
		if Rails.env.production?
			puts "searching #{unlisted.count}"
			unlisted.each do |release|
				if release.has_new_listing?
					puts "Release #{release.title || release.release_id} has a new listing"
					NotifierMailer.notify(release).deliver_now
					Blower.send_sms "New listing for http://www.discogs.com/release/#{@release.release_id}"
				end
			end
		end
	end
end
