class NotesController < ApplicationController
  respond_to :json

  expose(:notes) { Note.all.order('created_at asc') }
  expose(:note, attributes: :note_params)

  def create
    if note.save
      render json: note
    else
      render_validation_errors
    end
  end

  def update
    if note.update_attributes(content: note_params[:content])
      head :no_content
    else
      render_validation_errors
    end
  end

  def destroy
    note.destroy
    head :no_content
  end

  private
  def note_params
    params.require(:note).permit(:content)
  end

  def render_validation_errors
    render json: note.errors.full_messages, status: :unprocessable_entity
  end
end
