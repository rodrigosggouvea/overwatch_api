class Hero < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :health, presence: true
  validates :armour, presence: true
  validates :shield, presence: true
  validates :difficulty, presence: true
  validates :url, presence: true
end
