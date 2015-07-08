class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :created_at, :updated_at, :auth_token
end
