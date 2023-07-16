class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :provider, presence: true
  validates :uid, presence: true
end
