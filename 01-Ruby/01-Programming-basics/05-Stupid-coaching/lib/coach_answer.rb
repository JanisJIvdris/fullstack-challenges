def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message.include?("?")
    return "Silly question, get dressed and go to work!"
  elsif your_message.include?("I am going to work right now!")
    return ""
  else
    return "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours!
  if your_message.include?("?") && your_message.upcase == true
    return "I can feel your motivation! Silly question, get dressed and go to work!"
  elsif your_message.include?("I am going to work right now!") || your_message.include?("I am going to work right now!".upcase)
    return ""
  elsif your_message.upcase == true
    return "I can feel your motivation! I don't care, get dressed and go to work!"
  else
    return coach_answer(your_message)
  end
end
