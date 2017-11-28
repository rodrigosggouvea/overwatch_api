class Ability < ApplicationRecord
  belongs_to :hero

  validates :overwatch_api_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
