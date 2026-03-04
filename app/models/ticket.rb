#
# A Ticket validates information about itself when it is created, checking against the main database. 
# It also has many scopes that tell us the state or states of each Ticket.
#
class Ticket < ApplicationRecord

  belongs_to :region
  belongs_to :resource_category
  belongs_to :organization, optional: true

  validates :name, presence: true, length: { minimum: 1, maximum: 255 }, on: :create
  validates :phone, presence: true, phony_plausible: true
  validates :region_id, :resource_category_id, presence: true
  validates :description, length: { maximum: 1020 }, on: :create

  scope :open, -> () { where closed: false, organization_id: nil }
  scope :closed, -> () { where closed: true }
  scope :all_organization, -> () { where(closed: false).where.not(organization_id: nil) }
  scope :organization, -> (organization_id) { where(organization_id: organization_id, closed: false) }
  scope :closed_organization, -> (organization_id) { where(organization_id: organization_id, closed: true) }
  scope :region, -> (region_id) { where(region_id: region_id) }
  scope :resource_category, -> (resource_category_id) { where(resource_category_id: resource_category_id) }


  def open?
    !closed
  end

  def captured?
    organization.present?
  end

  def to_s
    "Ticket #{id}"
  end

end
