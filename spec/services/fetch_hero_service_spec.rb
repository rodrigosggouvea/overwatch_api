require 'rails_helper'

RSpec.describe FetchHeroService, type: :service do
  describe "Methods" do
    context "fetch_all" do
      it "should fetch all heroes from Overwatch's API and save them to the database" do
        FetchHeroService.fetch_all
        expect(Hero.count).not_to eql(0)
      end
    end
  end
end
