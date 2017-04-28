module ApplicationHelper
  # 不在意傳進來的是哪種類型 而是怎麼使用 Duck Typing
  def display_name(candidate)
    "#{candidate.name}(#{candidate.party})"
  end
end
