def french_phone_number?(phone_number)
  # TODO: true or false?
  if phone_number.match(/(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/)
    return true
  else
    return false
  end
end

puts french_phone_number?("0665363636")
