class Location < ActiveRecord::Base
  has_many :users

  def to_s
    "#{country}/#{city}"
  end
end
