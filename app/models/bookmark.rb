class Bookmark < ActiveRecord::Base
  belongs_to :domain

	validates :name, 	presence: true
	validates :url,		presence: true, uniqueness: true,
										format: URI::regexp(%w(http https))
	
	# Creates a domain
end
