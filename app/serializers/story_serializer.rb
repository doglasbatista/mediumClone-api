class StorySerializer < ActiveModel::Serializer
  attributes :title, :body

  has_one :user
end
