require 'rails_helper'

RSpec.describe Api::V1::HerosController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should call FetchHeroService if there are no heros on the database" do
      Hero.destroy_all
      expect(FetchHeroService).to receive(:fetch_all)
      get :index
    end

    it "should not call FetchHeroService otherwise" do
      FetchHeroService.fetch_all
      expect(FetchHeroService).not_to receive(:fetch_all)
      get :index
    end
  end

end
