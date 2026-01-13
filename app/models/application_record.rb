#
# ApplicationRecord is a child of ActiveRecord, which is in schema.rb. 
# ActiveRecord creates tables that detail what they contain and which fields are required. 
# There are no tables for ApplicationRecord at the moment.
#
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
