class User < ApplicationRecord
    has_secure_password
    has_many :kpi_data
    has_many :user_dashboards

    def pqlvr(curr_month, prev_month, year1, year2)
        curr_pql = self.kpi_data.find_all { |d| d.date.year == year1 && d.date.month == curr_month && d.kpi == 'Product Qualified Leads'}.map{ |kpi| kpi.data_point}.sum
        prev_pql = self.kpi_data.find_all { |d| d.date.year == year2 && d.date.month == prev_month && d.kpi == 'Product Qualified Leads'}.map{ |kpi| kpi.data_point}.sum

        return (((curr_pql.to_f - prev_pql.to_f)/prev_pql.to_f) * 100).round(2)

    end

    def conversion_rate(month, year)
        signups = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == month && d.kpi == 'Sign Ups'}.map{ |kpi| kpi.data_point}.sum
        
        muv = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == month && d.kpi == 'Monthly Unique Visitors'}.map{ |kpi| kpi.data_point}.sum

        return (signups.to_f/muv.to_f) * 100
    end

    def mrr(month, year)

            average_per_account = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == month && d.kpi == 'Average Revenue Per Account'}.map{ |kpi| kpi.data_point}.sum
            
            total_users = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == month && d.kpi == 'Total Users'}.map{ |kpi| kpi.data_point}.sum
    
            return (average_per_account.to_f * total_users.to_f)
    end


    def churn_rate(curr_month, prev_month, year1, year2)
            deleted_accounts = self.kpi_data.find_all { |d| d.date.year == year1 && d.date.month == curr_month && d.kpi == 'Deleted Accounts'}.map{ |kpi| kpi.data_point}.sum
            total_users_last_month = self.kpi_data.find_all { |d| d.date.year == year2 && d.date.month == prev_month && d.kpi == 'Total Users'}.map{ |kpi| kpi.data_point}.sum
    
            return (((deleted_accounts.to_f)/total_users_last_month.to_f) * 100).round(2)
    
    end

    def quarter_1(year, kpi)

        jan_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 1 && d.kpi == kpi}.map{ |d| d.data_point}.sum
        feb_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 2 && d.kpi == kpi}.map{ |d| d.data_point}.sum
        mar_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 3 && d.kpi == kpi}.map{ |d| d.data_point}.sum

        q1 = [{"title": "Jan", "data_point": jan_data}, {"title": "Feb", "data_point": feb_data}, {"title": "Mar", "data_point": mar_data}]
        return {"title": kpi, "data" => q1}

    end
    def quarter_2(year, kpi)

        apr_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 4 && d.kpi == kpi}.map{ |d| d.data_point}.sum
        may_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 5 && d.kpi == kpi}.map{ |d| d.data_point}.sum
        jun_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 6 && d.kpi == kpi}.map{ |d| d.data_point}.sum

        q2 = [{"title": "Apr", "data_point": apr_data}, {"title": "May", "data_point": may_data}, {"title": "Jun", "data_point": jun_data}]
        return {"title": kpi, "data" => q2}

    end
    def quarter_3(year, kpi)

        jul_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 7 && d.kpi == kpi}.map{ |d| d.data_point}.sum
        aug_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 8 && d.kpi == kpi}.map{ |d| d.data_point}.sum
        sep_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 9 && d.kpi == kpi}.map{ |d| d.data_point}.sum

        q3 = [{"title": "Jul", "data_point": jul_data}, {"title": "Aug", "data_point": aug_data}, {"title": "Sep", "data_point": sep_data}]
        return {"title": kpi, "data" => q3}

    end
    def quarter_4(year, kpi)

        oct_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 10 && d.kpi == kpi}.map{ |d| d.data_point}.sum
        nov_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 11 && d.kpi == kpi}.map{ |d| d.data_point}.sum
        dec_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 12 && d.kpi == kpi}.map{ |d| d.data_point}.sum

        q4 = [{"title": "Oct", "data_point": oct_data}, {"title": "Nov", "data_point": nov_data}, {"title": "Dec", "data_point": dec_data}]
        return {"title": kpi, "data" => q4}

    end
    
    def quarter_4(year, kpi)

        oct_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 10 && d.kpi == kpi}.map{ |d| d.data_point}.sum
        nov_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 11 && d.kpi == kpi}.map{ |d| d.data_point}.sum
        dec_data = self.kpi_data.find_all { |d| d.date.year == year && d.date.month == 12 && d.kpi == kpi}.map{ |d| d.data_point}.sum

        q4 = [{"title": "Oct", "data_point": oct_data}, {"title": "Nov", "data_point": nov_data}, {"title": "Dec", "data_point": dec_data}]
        return {"title": kpi, "data" => q4}

    end

    
    

end
