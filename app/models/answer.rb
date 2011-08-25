class Answer < ActiveRecord::Base

  belongs_to :url

  has_many :answer_relationships
  has_many :quests, :through => :answer_relationships

end
