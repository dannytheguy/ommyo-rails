class Omm < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  belongs_to :brand
  validates :brand, presence: true

  has_many :messages, inverse_of: :omm
  accepts_nested_attributes_for :messages
  validates :messages, presence: true

  default_scope -> { order('created_at DESC') }
end
