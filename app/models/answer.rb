class Answer < ActiveRecord::Base

  belongs_to :url

  has_many :answer_relationships
  has_many :quests, :through => :answer_relationships

  accepts_nested_attributes_for :url

end
