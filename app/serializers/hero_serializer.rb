include Rails.application.routes.url_helpers

class HeroSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :health, :armour, :shield, :real_name,
    :age, :height, :affiliation, :base_of_operations, :difficulty, :url

  def url
    api_v1_hero_url(object, host: (Rails.env.development? ? 'localhost:3000' : 'https://rodrigosggouveas-overwatch-api.herokuapp.com'))
  end
end
