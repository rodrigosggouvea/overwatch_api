require 'rails_helper'

RSpec.describe Hero, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:health) }
    it { should validate_presence_of(:armour) }
    it { should validate_presence_of(:shield) }
    it { should validate_presence_of(:difficulty) }
    it { should validate_presence_of(:url) }
  end
end
