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
      data: @heros.map { |hero| HeroSerializer.new(hero) }
    }.to_json
  end

  def show
    @hero = Hero.find(params[:id])
    render json: @hero
  end

  def abilities
    @abilities = Hero.find(params[:id]).abilities
    unless @abilities.any?
      FetchHeroService.fetch_hero_abilities(params[:id])
      @abilities = Hero.find(params[:id]).abilities
    end
    render json: @abilities.map { |hero| HeroAbilitySerializer.new(hero) }.to_json
  end
end
