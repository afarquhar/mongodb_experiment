APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

require 'rubygems'
require 'sinatra'
require 'haml'
require File.join(File.dirname(__FILE__), "requires")

configure do
  
  set :root, APP_ROOT
  set :views, File.expand_path(File.join(File.dirname(__FILE__), '..', 'views'))
  set :public, File.expand_path(File.join(File.dirname(__FILE__), '..', 'public'))
end

get '/' do
  deals = Retailer.first && Retailer.first.deals
  deals ||= []
  haml :index, :locals => {:deals => deals, :retailers => Retailer.all}
end

post '/create' do
  r = Retailer.new(:name => "Retailer #{Date.today}")
  d = Deal.new(:name => "Deal #{Date.today}")
  r.deals << d
  r.save
  redirect '/'
end




