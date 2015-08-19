# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
end

def can_be_created_in_a_block
  Movie.create do |m|
    m.title = "Movie"
  end
end

def can_get_the_first_item_in_the_database
  Movie.all.first.title
end

def can_get_the_last_item_in_the_database
  Movie.all.last.title
end

def can_get_size_of_the_database
  Movie.all.size
end

def can_find_the_first_item_from_the_database_using_id
  Movie.find(1).title
end

def can_find_by_different_attributes
  # title == "Title"
  # release_date == 2000,
  # director == "Me"
  Movie.where(title: "Title").take
end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by
  # release date descending
  Movie.where("release_date > 2002").order(release_date: :desc)
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick"
  m = Movie.create(title: "Awesome Flick")
  m.title = "Even Awesomer Flick"
  m.save
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  id = Movie.where(title: "Wat?")
  Movie.update(id,title: "Wat, huh?")
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  ha = {}
  5.times do |i|
    ha[i+1]={title: "A Movie"}
  end
  Movie.update(ha.keys,ha.values)
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  Movie.delete(Movie.where(title: "That One Where the Guy Kicks Another Guy Once"))
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.delete([1,2,3,4,5,6,7,8,9,10])
end
