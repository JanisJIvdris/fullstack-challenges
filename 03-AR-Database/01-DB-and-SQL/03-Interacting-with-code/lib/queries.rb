require "sqlite3"
db = SQLite3::Database.new("jukebox.sqlite")



def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  # Should return an integer of the number of artists.
  results = db.execute("SELECT COUNT(*) FROM artists")
  return results[0][0].to_i
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name.
  # Should return an integer of the number of rows.
  results = db.execute("SELECT COUNT(*) FROM #{table_name}")
  return results[0][0].to_i
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically.
  # Should return an array of strings sorted alphabetically.
  results = db.execute("SELECT name FROM artists ORDER BY name ASC").flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names.
  # Should return an array of strings (track names).
  results = db.execute("SELECT name FROM tracks WHERE name LIKE '%love%'").flatten
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending).
  # Should return an array of strings.
  results = db.execute("SELECT name FROM tracks WHERE milliseconds > #{min_length * 60_000} ORDER BY milliseconds ASC")
  return results.flatten
end

def albums_per_artist(db)
  # TODO: return an array of arrays, each containing the artist's name and the number of albums they have
  results = db.execute("SELECT a.name, COUNT(*) FROM albums JOIN artists a ON albums.artist_id = a.id GROUP BY a.name")
end
