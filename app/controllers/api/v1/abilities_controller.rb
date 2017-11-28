class Api::V1::AbilitiesController < ApplicationController

  def index
    @abilities = Ability.all
    unless @abilities.any?
      FetchAbilityService.fetch_all
      @abilities = Ability.all
    end
    render json: {
      total: @abilities.count,
      first: api_v1_abilities_url(page: 1),
      next: nil,
      previous: nil,
      last: api_v1_abilities_url(page: 1),
      data: @abilities.map { |ability| AbilitySerializer.new(ability) }
    }.to_json
  end

  def show
    @ability = Ability.find(params[:id])
    render json: @ability
  end
end
