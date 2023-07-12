class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :avatar, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
  validates :user_id, presence: true, uniqueness: true
end
