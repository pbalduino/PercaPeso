class Weight < ActiveRecord::Base
  validates_numericality_of :weight
  validates_size_of :weight, :minimum => 1, :maximum => 200
end
