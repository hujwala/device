class UserSerializer < ActiveModel::Serializer

  attributes :name, :email, :designation, :organization_name, :contact_number, :city, :state, :industry_domain, :organization_value, :uid
end
