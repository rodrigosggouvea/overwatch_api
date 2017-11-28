require 'rails_helper'

RSpec.describe Api::V1::AbilitiesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should call FetchAbilityService if there are no abilities on the database" do
      Ability.destroy_all
      expect(FetchAbilityService).to receive(:fetch_all)
      get :index
    end

    it "should not call FetchAbilityService otherwise" do
      FetchAbilityService.fetch_all
      expect(FetchAbilityService).not_to receive(:fetch_all)
      get :index
      expect(JSON.parse(response.body)['data'].first['id']).to eq(Ability.first.id)
    end
  end

end
