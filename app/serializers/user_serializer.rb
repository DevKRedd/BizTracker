class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :bio, :avatar, :first_name, :last_name, :company_name
end
