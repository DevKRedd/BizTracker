class KpiDatumSerializer < ActiveModel::Serializer
  attributes :id, :date, :kpi, :data_point
  has_one :user



end
