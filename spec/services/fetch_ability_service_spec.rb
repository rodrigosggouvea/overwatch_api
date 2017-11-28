require 'rails_helper'

RSpec.describe FetchAbilityService, type: :service do
  describe "Methods" do
    context "fetch_all" do
      it "should fetch all abilities from Overwatch's API and save them to the database" do
        Ability.destroy_all
        FetchAbilityService.fetch_all
        expect(Ability.count).not_to eql(0)
      end
    end
  end
end
