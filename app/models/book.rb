class Book < ActiveRecord::Base

  def self.generate(n)
    n.times do
      book = self.new
      book.title = Faker::Lorem.sentence(4)
      book.author = Faker::Name.name
      book.description = Faker::Lorem.paragraph
      book.content = Faker::Lorem.paragraph(40)
      book.save!
    end
  end

  def self.cache
    books_json = Book.all.to_json
    $redis.set("books", books_json)
  end

  def self.print_cache
    puts $redis.get("books")
  end

end
