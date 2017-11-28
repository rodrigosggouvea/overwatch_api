require 'rails_helper'

RSpec.describe FetchHeroService, type: :service do
  describe "Methods" do
    context "fetch_all" do
      it "should fetch all heroes from Overwatch's API and save them to the database" do
        Hero.destroy_all
        FetchHeroService.fetch_all
        expect(Hero.count).not_to eql(0)
      end
    end
    context "fetch_hero_abilities" do
      it "should fetch all hero's abilities from Overwatch's API and save them to the database" do
        Ability.destroy_all
        FetchHeroService.fetch_all
        hero = Hero.first
        FetchHeroService.fetch_hero_abilities(hero.id)
        expect(Ability.any?).to be_truthy
        expect(hero.reload.abilities.any?).to be_truthy
      end
    end
  end
end
