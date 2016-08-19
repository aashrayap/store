class PortalsController < ApplicationController
  def index
    @user=User.find_by_sql ["SELECT DISTINCT users.id,first_name,last_name,cities.name,checkout_date FROM users JOIN addresses ON (users.id=user_id) JOIN cities ON (city_id=cities.id) JOIN orders ON (users.id=orders.user_id) LIMIT 10"]


  end
end
