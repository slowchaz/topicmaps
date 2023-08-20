class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    normalized_name = topic_params[:name].strip.downcase
    @topic = Topic.find_or_create_by(name: normalized_name)

    if @topic.persisted?
      redirect_to @topic
    else
      render :new, status: 422
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @notes = @topic.notes
    @note = Note.new

    @nodes = [@topic] + @topic.notes
    @links = @topic.notes.map { |note| {source: @topic, target: note} }
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
