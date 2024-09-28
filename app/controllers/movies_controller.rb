class MoviesController < ApplicationController
  def create_movie
    @movie=Movie.new
    @movie.title=params.fetch("movie_title")
    @movie.year=params.fetch("movie_year")
    @movie.duration=params.fetch("movie_duration")
    @movie.description=params.fetch("movie_description")
    @movie.image=params.fetch("movie_image")
    @movie.director_id=params.fetch("movie_director_id")
    
    @movie.save
      redirect_to("/movies", {:notice => "New Movie created successfully."})
    end

  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  
end
