class Perform < ActiveRecord::Base
   has_many :performreplies
   require 'csv'
   def self.import(file)
      CSV.foreach(file.path, headers: true, encoding:'r:iso-8859-1:utf-8') do |row|
         Perform.create! row.to_hash
      end
   end
   has_many :performreplies
end
