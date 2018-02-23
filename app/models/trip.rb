class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_distance
    trails.total_length
  end

  def average_distance
    trails.average_length
  end

  def longest_distance
    trails.longest
  end
end
