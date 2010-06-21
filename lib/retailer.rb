class Retailer
  include Mongoid::Document
  
  field :name
  embeds_many :deals
end