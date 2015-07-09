class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  validates :review, :presence => :true
end
