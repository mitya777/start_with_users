class Quest < ActiveRecord::Base

  belongs_to :user
  belongs_to :url

  has_many :answer_relationships
  has_many :answers, :through => :answer_relationships

  accepts_nested_attributes_for :url
  accepts_nested_attributes_for :answer_relationships
 
end
