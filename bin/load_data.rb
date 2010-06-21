
require File.join(File.dirname(__FILE__), %w[.. lib requires])

Retailer.delete_all

p start = Time.now
n_retailers = 3
deals_per_retailer = 5000

(0..n_retailers).each do |r|
  retailer = Retailer.create(:name => "retailer #{r}")
  (0..deals_per_retailer).each do |d|
    retailer.deals << Deal.new(:name => "deal #{r}_#{d}")
  end
  retailer.save
end

p Time.now - start