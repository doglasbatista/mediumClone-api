class Api::V1::StoriesController < Api::V1::ApplicationController

  def create
    story = Story.new(story_params)

    if story.save
      render json: story, status: :created
    else
      render json: { errors: story.errors }, status: :unprocessable_entity
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :body).merge(user: current_user)
  end

end