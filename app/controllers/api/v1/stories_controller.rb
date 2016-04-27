class Api::V1::StoriesController < Api::V1::ApplicationController
  skip_before_action :auth_user_from_token, only: [:show]

  def create
    story = Story.new(story_params)

    if story.save
      render json: story, status: :created
    else
      render json: { errors: story.errors }, status: :unprocessable_entity
    end
  end

  def show
    story = Story.find_by(id: params[:id])
    if story
      render json: story, serializer: StorySerializer
    else
      render json: { errors: I18n.t('application.errors.not_found') }, status: 404
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :body).merge(user: current_user)
  end

end