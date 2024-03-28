def wagon_sort(array)
  # TODO: return (not print!) a copy of students, sorted alphabetically
  array.sort_by! { |string| string.downcase }
end
