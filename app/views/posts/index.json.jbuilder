json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :access_info, :type, :country, :city, :postcode, :latitude, :longitude, :bedrooms, :sf_entry, :sf_bathroom, :sf_bedroom, :roll_shower, :price, :availability, :user_id
  json.url post_url(post, format: :json)
end
