# 
# ResourceCategory is a child of ApplicationRecord. 
# It contains many tickets and organizations, and also belongs to many organizations. 
# It validates the presence of a name as well as its length and uniqueness. 
# It has scopes for active and inactive, and methods to activate or deactivate them.
# 
class ResourceCategory < ApplicationRecord

  has_and_belongs_to_many :organizations
  has_many :tickets

  validates_presence_of :name
  validates_length_of :name, minimum: 1, maximum: 255, on: :create
  validates_uniqueness_of :name, case_sensitive: false

  scope :active, -> () { where active: true }
  scope :inactive, -> () { where active: false }

  def self.unspecified
    ResourceCategory.find_or_create_by(name: 'Unspecified')
  end

  def activate
    self.update(active: true)
  end

  def deactivate
    self.update(active: false)
  end

  def inactive?
    !active?
  end

  def to_s
    name
  end

end
