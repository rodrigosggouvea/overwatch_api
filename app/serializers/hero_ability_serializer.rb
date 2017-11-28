class HeroAbilitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :is_ultimate

  def url
    api_v1_ability_url(object, host: 'localhost:3000')
  end
end
