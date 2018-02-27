# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
    SELECT
      title
    FROM
      movies
    JOIN
      castings
    ON
      movies.id = castings.movie_id
    JOIN
      actors
    ON
      actors.id = castings.actor_id
    WHERE
      actors.name = 'Harrison Ford'
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
    SELECT
      title
    FROM
      movies
    JOIN
      castings
    ON
      castings.movie_id = movies.id
    JOIN
      actors
    ON
      actors.id = castings.actor_id
    WHERE
      NOT castings.ord = 1 AND actors.name = 'Harrison Ford'
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
    SELECT
      title, actors.name
    FROM
      movies
    JOIN
      castings
    ON
      castings.movie_id = movies.id
    JOIN
      actors
    ON
      actors.id = castings.actor_id
    WHERE
      castings.ord = 1 AND movies.yr = 1962
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
    SELECT
      yr, COUNT(movies)
    FROM
      movies
    JOIN
      castings
    ON
      castings.movie_id = movies.id
    JOIN
      actors
    ON
      actors.id = castings.actor_id
    WHERE
      actors.name = 'John Travolta'
    GROUP BY
      movies.yr
    HAVING
      COUNT(movies) > 1
    SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
    SELECT
      title, actors.name
    FROM
      actors
    JOIN
      castings ON castings.actor_id = actors.id
    JOIN
      movies on castings.movie_id = movies.id
    JOIN
      castings AS c2 ON c2.movie_id = movies.id
    JOIN
      actors as a2 ON a2.id = c2.actor_id
    WHERE
      castings.ord = 1 AND a2.name = 'Julie Andrews'
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
    SELECT
      actors.name
    FROM
      castings
    JOIN
      actors ON actors.id = castings.actor_id
    JOIN
      movies ON castings.movie_id = movies.id
    WHERE
      castings.ord = 1
    GROUP BY
      actors.name
    HAVING
      COUNT(actors.name) > 14
    ORDER BY
      actors.name ASC

  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
    SELECT
      title, COUNT(castings.actor_id) AS actor_count
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    WHERE
      movies.yr = 1978
    GROUP BY
      movies.title
    ORDER BY
      actor_count DESC, title ASC
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
    SELECT
      a2.name
    FROM
      actors
    JOIN
      castings ON actors.id = castings.actor_id
    JOIN
      movies ON movies.id = castings.movie_id
    JOIN
      castings AS c2 ON c2.movie_id = castings.movie_id
    JOIN
      actors AS a2 ON a2.id = c2.actor_id
    WHERE
      actors.name = 'Art Garfunkel' AND NOT a2.name = 'Art Garfunkel'
  SQL
end
