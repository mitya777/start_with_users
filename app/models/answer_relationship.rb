class AnswerRelationship < ActiveRecord::Base

  belongs_to :quest
  belongs_to :answer
end
