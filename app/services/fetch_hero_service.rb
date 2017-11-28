require 'net/http'
require 'json'

class FetchHeroService
  def self.fetch_all
    url = 'https://overwatch-api.net/api/v1/hero'

    response = JSON.parse(Net::HTTP.get(URI(url)))
    parse_heroes(response['data'])
  end

  def self.parse_heroes(heroes)
    heroes.map { |hero| parse_hero(hero) }
  end

  def self.parse_hero(hero_params)
    hero_params.delete('url')
    overwatch_api_id = hero_params.delete('id')
    hero = Hero.find_or_initialize_by(overwatch_api_id: overwatch_api_id)
    if hero.new_record?
      hero.assign_attributes(hero_params)
      hero.save
    else
      hero.update(hero_params)
    end
    return hero
  end

  def self.fetch_hero_abilities(hero_id)
    hero = Hero.find(hero_id)
    url = "https://overwatch-api.net/api/v1/hero/#{hero.overwatch_api_id}"
    response = JSON.parse(Net::HTTP.get(URI(url)))
    parse_abilities(response['abilities'])
  end

  def self.parse_abilities(abilities, hero_id)
    abilities.map { |ability| parse_ability(ability, hero_id) }
  end

  def self.parse_ability(ability_params, hero_id)
    ability_params.delete('url')
    ability_params['hero_id'] = hero_id
    overwatch_api_id = ability_params.delete('id')
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
