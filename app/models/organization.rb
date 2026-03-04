#
# Organization is a child of ApplicationRecord and describes a group of users. 
# It contains many users and tickets. It also has many resource_catagories but also belongs to many resource_catagories. 
# It validates many fields such as email, name, and phone. 
# Email and name have their length and uniqueness validated, and email also has its format validated. 
# Finally, description has its length validated. There are several methods to change self.status.
#
class Organization < ApplicationRecord

  attr_accessor :agreement_one, :agreement_two, :agreement_three, :agreement_four, :agreement_five, :agreement_six, :agreement_seven, :agreement_eight

  attribute :status, :integer, default: 1
  attribute :transportation, :integer
  enum status: [:approved, :submitted, :rejected, :locked]
  enum transportation: [:yes, :no, :maybe]

  after_initialize :set_default_status, if: :new_record?

  has_many :users
  has_many :tickets
  has_and_belongs_to_many :resource_categories

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 1, maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { minimum: 1, maximum: 255 }, uniqueness: { case_sensitive: false }, on: :create
  validates :phone, :status, :primary_name, :secondary_name, :secondary_phone, presence: true
  validates :description, length: { maximum: 1020 }, on: :create

  def approve
    self.status = :approved
  end

  def reject
    self.status = :rejected
  end

  def set_default_status
    self.status ||= :submitted
  end

  def to_s
    name
  end

end
