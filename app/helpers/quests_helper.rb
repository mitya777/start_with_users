module QuestsHelper

  def current_quest= (quest)
    cookies.permanent[:quest_token] = quest
    @current_quest = quest
  end

  def current_quest
    @current_quest ||= cookies[:quest_token]
  end
end
