class Api::V1::HerosController < ApplicationController
  def index
    @heros = Hero.all
    unless @heros.any?
      FetchHeroService.fetch_all
      @heros = Hero.all
    end
    render json: {
      total: @heros.count,
      first: api_v1_heros_url(page: 1),
      next: nil,
      previous: nil,
      last: api_v1_heros_url(page: 1),
      data: @heros
    }.to_json
  end

  def show
    @hero = Hero.find(params[:id])
    render json: @hero
  end
end
