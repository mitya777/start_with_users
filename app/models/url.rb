class Url < ActiveRecord::Base

  has_many :quests
  has_many :answers
end
