class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :type
	has_many :photos
	accepts_nested_attributes_for :photos

	geocoded_by :address
	after_validation :geocode

	def address
	  [country, city, postcode].compact.join(', ')]
	end
end
