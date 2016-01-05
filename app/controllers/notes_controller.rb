class NotesController < ApplicationController
  respond_to :json

  expose(:notes) { Note.all.order('created_at asc') }
  expose(:note, attributes: :note_params)

  def create
    if note.save
      redirect_to note, notice: 'Note was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    note.update_attributes(content: note_params[:content])
    head :no_content
  end

  def destroy
    note.destroy
    head :no_content
  end

  private
    def note_params
      params.require(:note).permit(:content)
    end
end
