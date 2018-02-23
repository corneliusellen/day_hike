class Trail < ApplicationRecord
  has_many :trip_trails
  has_many :trips, through: :trip_trails

  def self.total_length
    sum(:length)
  end

  def self.average_length
    average(:length)
  end

  def self.longest
    maximum(:length)
  end
end
