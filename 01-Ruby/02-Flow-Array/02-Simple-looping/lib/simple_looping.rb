def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  sum_for = 0

  if min > max
    return -1
  else
    for i in min..max do
      sum_for += i
    end
    return sum_for
  end
end

def sum_with_while(min, max)
  return -1 if min > max

  sum_while = 0
  i = min
  while i <= max
    sum_while += i
    i += 1
  end
  return sum_while
end
