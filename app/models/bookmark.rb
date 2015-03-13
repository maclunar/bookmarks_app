class Bookmark < ActiveRecord::Base
  belongs_to :domain

	acts_as_taggable

	validates :name, 	presence: true
	validates :url,		presence: true, uniqueness: true,
										format: URI::regexp(%w(http https))
	
	# Returns a domain from the URL.
	def extract_domain
		parsed_url = URI.parse(url)
		return parsed_url.host
	end

	def update_domain
		ed = extract_domain

		if (Domain.find_by(domain: ed)).nil?
			Domain.create(domain: ed)
		end
		update(domain_id: Domain.find_by(domain: ed).id)
	end
end
