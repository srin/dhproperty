json.array!(@posts) do |post|
  json.extract! post, :id, :title, :description, :access_info, :country, :state, :city, :postcode, :latitute, :longitude, :bedrooms, :sf_entry, :sf_bathroom, :sf_bedroom, :roll_shower, :price, :price_info, :proptype, :longterm, :shortterm, :holiday, :user_id
  json.url post_url(post, format: :json)
end
