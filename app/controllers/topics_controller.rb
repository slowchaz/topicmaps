class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.find_or_create_by(name: topic_params[:name])

    if @topic.persisted?
      redirect_to @topic
    elsif
      @topic.save
      redirect_to root_path, notice: 'Topic was successfully created.'
    else
      render :new, status: 422
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @notes = @topic.notes
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
