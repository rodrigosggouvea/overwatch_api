require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:overwatch_api_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  describe "Relationships" do
    it { should belong_to(:hero) }
  end
end
