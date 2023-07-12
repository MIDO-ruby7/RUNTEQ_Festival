class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :avatar, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
  validates :user_id, presence: true, uniqueness: true
end
