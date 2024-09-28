class ActorsController < ApplicationController

  def delete_actor
    @actor=Actor.where({ :id => params.fetch("path_id") }).first
    @actor.destroy
    redirect_to("/actors")
  end

  def update_actor
    the_id = params.fetch("path_id")
    @actor = Actor.where({ :id => the_id }).first
    @actor.name = params.fetch("actor_name")
    @actor.dob = params.fetch("actor_dob")
    @actor.bio = params.fetch("actor_bio")
    @actor.image = params.fetch("actor_image")

    if @actor.valid?
      @actor.save
      redirect_to("/actors/#{@actor.id}", { :notice => "Course updated successfully."} )
    else
      redirect_to("/actors/#{@actor.id}", { :alert => "Course failed to update successfully." })
    end

  end

  def create_actor
    actor=Actor.new
    actor.name=params.fetch("actor_name")
    actor.dob=params.fetch("actor_dob")
    actor.bio=params.fetch("actor_bio")
    actor.image=params.fetch("actor_image")
    actor.save
    redirect_to("/actors")
  end 

  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
