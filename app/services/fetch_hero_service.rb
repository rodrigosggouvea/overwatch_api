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
  end
end
