class CreateUserDashboards < ActiveRecord::Migration[6.1]
  def change
    create_table :user_dashboards do |t|
      t.string :dashboard_title
      t.string :chart_type
      t.integer :quarter_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
