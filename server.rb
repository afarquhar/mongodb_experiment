require 'rubygems'
require 'sinatra'
require 'haml'
require File.join(File.dirname(__FILE__), %w{lib requires})

configure do
end

get '/' do
  deals = Retailer.first && Retailer.first.deals
  deals ||= []
  haml :index, :locals => {:deals => deals, :retailers => Retailer.all.sort_by {|r| r.id }}
end

post '/create_deal' do
  p params
  r = Retailer.find(params[:retailer])
  d = Deal.new(:name => "Deal #{Date.today}")
  r.deals << d
  r.save
  redirect '/'
end

post '/create_retailer' do
  
  Retailer.create(:name => "#{Time.now}")
  redirect '/'
end




