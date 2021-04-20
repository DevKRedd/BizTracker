class UserDashboardSerializer < ActiveModel::Serializer
  attributes :id, :dashboard_title, :chart_type, :quarter_number
  has_one :user
end
