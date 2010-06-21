require 'rubygems'
gem "mongo_ext"
gem "bson_ext"
gem "mongoid", "=1.9.0"

require "mongoid"
# require "googlecharts"

module Mongo
  def self.mongo_url
    "mongodb://alex:password@localhost:27017/omio"
  end

  def self.database
    "omio"
  end
  
  def connect
    Mongoid.configure do |config|
      config.master = Mongo::Connection.from_uri(mongo_url).db(database)
    end
  end
  
  module_function :connect
end

Mongo.connect