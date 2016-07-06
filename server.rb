require 'sinatra'
require 'active_record'

class ViewingHistory < ActiveRecord::Base
end

get '/viewing_history' do
  content_type :json
  ViewingHistory.establish_connection(
    :adapter => "sqlite3",
    :database => "/Users/shailpatel/activity.db"
  )
  result = { "viewing_history" => [] }
  ViewingHistory.all.each do |viewing_history|
    result["viewing_history"] << { :date => viewing_history.date, :name => viewing_history.name }
  end
  response.headers['Access-Control-Allow-Origin'] = '*'
  result.to_json
end
