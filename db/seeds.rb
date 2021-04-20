# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserDashboard.destroy_all
KpiDatum.destroy_all
User.destroy_all

User.create(email: "that@that.com", password: "yesPass", bio: "Mine", avatar: "air bender", first_name: "Billy", last_name: "Joe", company_name: "Billy Joe Co", active_charts: "Monthly Unique Visitors, Sign Ups")

User.create(email: "khalinredd@gmail.com", password: "khalinlight", bio: "Mine", avatar: "air bender", first_name: "Billy", last_name: "Joe", company_name: "Khalin Co", active_charts: "Monthly Unique Visitors, Sign Ups")


KpiDatum.create(date: DateTime.new(2021,3,22), kpi: 'Monthly Unique Visitors', data_point: 2000, user_id: User.all.first.id)
KpiDatum.create(date: DateTime.new(2021,3,22), kpi: 'Product Qualified Leads', data_point: 1000, user_id: User.all.first.id)
KpiDatum.create(date: DateTime.new(2021,2,22), kpi: 'Product Qualified Leads', data_point: 900, user_id: User.all.first.id)
KpiDatum.create(date: DateTime.new(2021,3,22), kpi: 'Sign Ups', data_point: 800, user_id: User.all.first.id)
KpiDatum.create(date: DateTime.new(2021,3,22), kpi: 'Average Revenue Per Account', data_point: 12, user_id: User.all.first.id)
KpiDatum.create(date: DateTime.new(2021,3,22), kpi: 'Total Users', data_point: 8000, user_id: User.all.first.id)
KpiDatum.create(date: DateTime.new(2021,2,22), kpi: 'Total Users', data_point: 7800, user_id: User.all.first.id)
KpiDatum.create(date: DateTime.new(2021,1,22), kpi: 'Total Users', data_point: 7600, user_id: User.all.first.id)
KpiDatum.create(date: DateTime.new(2021,3,22), kpi: 'Deleted Accounts', data_point: 200, user_id: User.all.first.id)


UserDashboard.create(dashboard_title: 'Total Users', chart_type: 'Bar', quarter_number: 1, user_id: User.all.first.id, year:2021)
UserDashboard.create(dashboard_title: 'Monthly Unique Visitors', chart_type: 'Line', quarter_number: 2, user_id: User.all.first.id, year:2021)

UserDashboard.create(dashboard_title: 'Monthly Unique Visitors', chart_type: 'Line', quarter_number: 2, user_id: User.all.last.id, year:2021)




