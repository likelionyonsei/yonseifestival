class Pub < ActiveRecord::Base
   require 'csv'
   def self.import(file)
      CSV.foreach(file.path, headers: true, encoding:'r:iso-8859-1:utf-8') do |row|
         Pub.create! row.to_hash
      end
   end
   has_many :pubreplies
end

