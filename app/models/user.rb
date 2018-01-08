class User < ActiveRecord::Base
  has_secure_password

  has_many :groups
  has_many :groups_joined,through: :members




  #validations
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  
  #validating name,alias
  validates :name, :alias, presence: true, length: { minimum: 3}
  #validates email
  validates :email,presence: true, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX}

  #validates password (must be 8 characters)
  validates :password,presence: true, length: {minimum: 8}, on: :create


end
