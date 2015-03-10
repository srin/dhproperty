class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :proptype
	has_many :photos
	has_many :orders
	
	
	accepts_nested_attributes_for :photos

	geocoded_by :address
	after_validation :geocode

	def country_name
    country_name = ISO3166::Country[country]
    country_name.translations[I18n.locale.to_s] || country.name
	end

	def address
	  [country, state, city, postcode].compact.join(', ')
	end

	has_attached_file :avatar, :styles => { :medium => "400x400!", :thumb => "200x200!" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
