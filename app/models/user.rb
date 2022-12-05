class User < ApplicationRecord
  has_many :posts, foreign_key: "author_id", dependent: :destroy
  has_many :comments, foreign_key: "author_id", dependent: :destroy

  has_many :friend_requests, dependent: :destroy, foreign_key: :user_id
  has_many :pending_friends, through: :friend_requests, source: :friend

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :likes, dependent: :destroy

  has_one_attached :avatar

  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]


  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
