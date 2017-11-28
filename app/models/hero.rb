class Hero < ApplicationRecord
  has_many :abilities

  validates :overwatch_api_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :health, presence: true
  validates :armour, presence: true
  validates :shield, presence: true
  validates :difficulty, presence: true
end
