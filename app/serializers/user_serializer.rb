class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :pronouns, :password_digest
end
