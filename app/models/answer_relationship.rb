class AnswerRelationship < ActiveRecord::Base

  belongs_to :quest
  belongs_to :answer

  accepts_nested_attributes_for :answer
end
