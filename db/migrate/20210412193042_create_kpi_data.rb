class CreateKpiData < ActiveRecord::Migration[6.1]
  def change
    create_table :kpi_data do |t|
      t.date :date
      t.string :kpi
      t.integer :data_point
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
