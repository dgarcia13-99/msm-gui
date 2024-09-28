class DirectorsController < ApplicationController

  def delete_director
    @director=Director.where({ :id => params.fetch("path_id") }).first
    @director.destroy
    redirect_to("/directors")
  end

  def update_director
    the_id = params.fetch("path_id")
    @director = Director.where({ :id => the_id }).first
    @director.name = params.fetch("director_name")
    @director.dob = params.fetch("director_dob")
    @director.bio = params.fetch("director_bio")
    @director.image = params.fetch("director_image")

    if @director.valid?
      @director.save
      redirect_to("/directors/#{@director.id}", { :notice => "Course updated successfully."} )
    else
      redirect_to("/directors/#{@director.id}", { :alert => "Course failed to update successfully." })
    end

  end

  def create_director
    @director = Director.new
    @director.name=params.fetch("director_name")
    @director.dob=params.fetch("director_dob")
    @director.bio=params.fetch("director_bio")
    @director.image=params.fetch("director_image")
    if @director.valid?
      @director.save
      redirect_to("/directors", { :notice => "New Director created successfully." })
    else
      redirect_to("/directors", { :notice => "New Director failed to create successfully." })
    end
  end

  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
end
