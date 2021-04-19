class UserDashboardSerializer < ActiveModel::Serializer
  attributes :id, :dashboard_title, :chart_type, :uquarter_number
  has_one :user
end
