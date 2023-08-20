class NotesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @note = @topic.notes.build(note_params)

    if @note.save
      redirect_to @topic, notice: 'Note was successfully created.'
    else
      # Handle the error case, possibly re-rendering the show action in TopicsController
    end
  end

  private

  def note_params
    params.require(:note).permit(:content, :topic_id) # Include :topic_id if using the hidden field method
  end
end
