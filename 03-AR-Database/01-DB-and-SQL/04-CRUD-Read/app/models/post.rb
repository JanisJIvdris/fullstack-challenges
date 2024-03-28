# You can use a global variable, DB, which is an instance of SQLite3::Database
# No need to create it, you can just use it!

class Post
  attr_accessor :title, :url
  attr_reader :id, :votes

  def initialize(attributes = {})
    @id = attributes[:id].to_i
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes].to_i
    # TODO
  end

  def self.find(id)
    DB.results_as_hash = true
    # TODO
    result = DB.execute("SELECT * FROM  posts WHERE id = ?", id)
    result = result[0]
    if result.nil?
      return nil
    else
      attributes = { id: result["id"], title: result["title"], url: result["url"], votes: result["votes"] }


      return Post.new(attributes)
    end
  end

  def self.all
    DB.results_as_hash = true
    # TODO
    results = DB.execute("SELECT * FROM posts")
    posts = results.map do |result|
      attributes = { id: result["id"], title: result["title"], url: result["url"], votes: result["votes"] }
      Post.new(attributes)
    end
  end
end
