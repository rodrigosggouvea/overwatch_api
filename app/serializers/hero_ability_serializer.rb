class HeroAbilitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_ultimate

  def url
    api_v1_ability_url(object, host: (Rails.env.development? ? 'localhost:3000' : 'https://rodrigosggouveas-overwatch-api.herokuapp.com'))
  end
end
