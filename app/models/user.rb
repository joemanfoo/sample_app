class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  attr_accessible :name, :email, :password, :password_confirmation

  before_save { email.downcase! }
  before_save :create_remember_token

  field :name,            type: String
  field :email,           type: String
  field :admin,           type: Boolean
  field :remember_token,  type: String
  field :password_digest, type: String
  field :followed,        type: Array  # user's we are following
  field :followers,       type: Array  # users who are following us

  has_many :microposts, dependent: :delete, autosave: true


  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
  			format: { with: VALID_EMAIL_REGEX }, 
  			uniqueness: { case_sensitive: false }


  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  index( { email: 1 }, { unique: true, name: "email_index" } )
  index( { remember_token: 1} )
  index( { followed: 1}, { sparse: true } )
  index( { followers: 1}, { sparse: true } )

  has_secure_password

  def follow!(other_user)
    # when we follow someone, we also add us to their followers list
    self.add_to_set(:followed, other_user.id)
    other_user.add_to_set(:followers, self.id)
  end

  def unfollow!(other_user)
    # when we unfollow someone, we also remove us from their followers list
    self.pull(:followed, other_user.id)
    other_user.pull(:followers, self.id)
  end

  def feed
    Micropost.from_users_followed_by(self)
  end

  def toggle!(field)
    send "#{field}=", !self.send("#{field}?")
    save :validation => false
  end

#  def feed
    # This is preliminary
#    Micropost.where(user_id: id)
#  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
end
