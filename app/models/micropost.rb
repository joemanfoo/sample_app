class Micropost
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_protected :user_id

  field :content, type: String

  belongs_to :user

  default_scope order_by(created_at: :desc)

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  index( { user_id: 1, created_ad: 1 } )

  def self.from_users_followed_by(user)
  	ids = user.followed
  	ids << user.id
  	Micropost.in(user_id: ids)
  end

end
