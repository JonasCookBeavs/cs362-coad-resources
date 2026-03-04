#
# The User class holds a bunch of information about each user. 
# When a user is created, it also validates information such as the length of their email and password being valid.
#
class User < ApplicationRecord

  attribute :role, :integer, default: 1
  enum role: [:admin, :organization]
  after_initialize :set_default_role, if: :new_record?

  belongs_to :organization, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 1, maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 7, maximum: 255 }, on: :create

  def set_default_role
    self.role ||= :organization
  end

  def to_s
    email
  end

end
