class DashboardController < ApplicationController
  def index
    #past 7, 30, and 365 days user
    @past_time=[7,30,"all time"]
    @users_7=User.where(:created_at => (Time.now-7.day)..Time.now)
    @users_30=User.where(:created_at => (Time.now-30.day)..Time.now)
    @users_10000=User.where(:created_at => (Time.now-10000.day)..Time.now)
    @timespan_users=[@users_7,@users_30,@users_10000]

    #past orders 7,30,365
    @orders_7=Order.where(:checkout_date => (Time.now-7.day)..Time.now)
    @orders_30=Order.where(:checkout_date => (Time.now-30.day)..Time.now)
    @orders_10000=Order.where(:checkout_date => (Time.now-10000.day)..Time.now)
    @timespan_orders=[@orders_7,@orders_30,@orders_10000]

  
    @products_7=Product.where(:created_at => (Time.now-7.day)..Time.now)
    @products_30=Product.where(:created_at => (Time.now-30.day)..Time.now)
    @products_10000=Product.where(:created_at => (Time.now-10000.day)..Time.now)
    @timespan_products=[0,0,100]


    @top_three_states= User.find_by_sql ["SELECT states.name, COUNT(states.name) FROM users JOIN addresses ON (users.id=user_id) JOIN states ON (state_id = states.id) GROUP BY states.name ORDER BY COUNT(states.name) desc LIMIT 3"]
    @top_three_cities= User.find_by_sql ["SELECT cities.name, COUNT(cities.name) FROM users JOIN addresses ON (users.id=user_id) JOIN cities ON (city_id=cities.id) GROUP BY cities.name ORDER BY COUNT(cities.name) desc LIMIT 3"]

  end
end
