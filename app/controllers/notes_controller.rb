class NotesController < ApplicationController
  respond_to :json

  expose(:notes)
  expose(:note, attributes: :note_params)

  def create
    if note.save
      redirect_to note, notice: 'Note was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if note.update(note_params)
      redirect_to note, notice: 'Note was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private
    def note_params
      params.require(:note).permit(:content)
    end
end
