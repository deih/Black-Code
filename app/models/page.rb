class Page < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	translates :title, :description
end
