class ProfilesSerializer < ActiveModel::Serializer
  attributes :id,:user_name, :email,:fname,:lname
end
