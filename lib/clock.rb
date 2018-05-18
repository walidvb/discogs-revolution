require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork
module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

	every(1.minute, 'Checking releases', at: "#{Time.now.hour}:#{Time.now.min}") do
		notify_for_new_releases
	end

	def notify_for_new_releases
		unlisted = Release.unlisted
		puts "searching #{unlisted.count}"
		unlisted.each do |release|
			if release.has_new_listing?
				puts "Release #{release.title || release.release_id} has a new listing"
				NotifierMailer.notify(release).deliver_now
			end
		end
	end
end
