class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  attr_accessible :name, :email, :password, :password_confirmation

  before_save { email.downcase! }

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  			format: { with: VALID_EMAIL_REGEX }, 
  			uniqueness: { case_sensitive: false }


  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  index( { email: 1 }, { unique: true, name: "email_index" } )
  
  has_secure_password

end
