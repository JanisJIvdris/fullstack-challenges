def circle_area(radius)
  # TODO: Implement the `circle_area` method
  if radius.positive?
    return(3.14 * (radius**2))
  else
    return 0
  end
end

puts circle_area(100)
