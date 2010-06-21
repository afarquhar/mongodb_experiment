class Deal
  include Mongoid::Document
  
  field :name
  embedded_in :retailer, :inverse_of => :deals
end