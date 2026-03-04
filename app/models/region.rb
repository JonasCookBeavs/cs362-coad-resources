#
# Region is a child of ApplicationRecord. 
# It contains many tickets and validates the presence of a name as well as its length and uniqueness.
#

class Region < ApplicationRecord

  has_many :tickets

  validates :name, presence: true, length: { minimum: 1, maximum: 255 }, uniqueness: { case_sensitive: false }, on: :create

  def self.unspecified
    Region.find_or_create_by(name: 'Unspecified')
  end

  def to_s
    name
  end

end
