module ApplicationHelper
  def capitalized_sentence(sentence)
    sentence.split(" ").map(&:capitalize).join(" ")
  end
end
