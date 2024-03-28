def compute_name(first_name, middle_name, last_name)
  # TODO: return full name using string interpolation
  full_name = "#{first_name.capitalize} #{middle_name.capitalize} #{last_name.capitalize}"
  return full_name.to_s
end
