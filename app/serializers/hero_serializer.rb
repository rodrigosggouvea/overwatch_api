class HeroSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :health, :armour, :shield, :real_name,
    :age, :height, :affiliation, :base_of_operations, :difficulty

  def url
    api_v1_hero_url(object)
  end
end
