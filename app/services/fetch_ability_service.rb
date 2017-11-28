require 'net/http'
require 'json'

class FetchAbilityService
  def self.fetch_all
    url = 'https://overwatch-api.net/api/v1/ability?page=1'

    abilities_params = []

    response = JSON.parse(Net::HTTP.get(URI(url)))

    last_url = response['last']

    abilities_params += response['data']

    last_page = last_url.gsub('http://overwatch-api.net/api/v1/ability?page=', '').to_i

    (2..last_page).each do |page|
      url = "https://overwatch-api.net/api/v1/ability?page=#{page}"
      response = JSON.parse(Net::HTTP.get(URI(url)))
      abilities_params += response['data']
    end

    parse_abilities(abilities_params)
  end

  def self.parse_abilities(abilities)
    abilities.map { |ability| parse_ability(ability) }
  end

  def self.parse_ability(ability_params)
    ability_params.delete('url')
    overwatch_api_id = ability_params.delete('id')
    overwatch_hero_id = ability_params.delete('hero')['id']
    heroes = Hero.where(overwatch_api_id: overwatch_hero_id)
    if heroes.any?
      hero = heroes.first
    else
      FetchHeroService.fetch_all
      hero = Hero.where(overwatch_api_id: overwatch_hero_id).first
    end
    ability_params['hero_id'] = hero.id
    ability = Ability.find_or_initialize_by(overwatch_api_id: overwatch_api_id)
    if ability.new_record?
      ability.assign_attributes(ability_params)
      ability.save
    else
      ability.update(ability_params)
    end
    return ability
  end
end
