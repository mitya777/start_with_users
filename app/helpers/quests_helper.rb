module QuestsHelper

  def current_quest= (quest)
    @current_quest
  end

  def set_current_quest(quest)
    cookies.permanent[:quest_token] = quest.id
    self.current_quest = quest
  end

  def current_quest
    Rails.logger.debug "CURRENT QUEST(helper): #{cookies[:quest_token] unless cookies[:quest_token].blank?}"
    @current_quest ||= !cookies[:quest_token].blank? ? Quest.find(*cookies[:quest_token]) : nil
  end

  def quest_token
    cookies[:quest_token] || [nil, nil]
  end

  def current_quest?
    !current_quest.blank?
  end

  def clear_current_quest
    cookies.delete(:quest_token)
    self.current_quest = nil
  end
end
