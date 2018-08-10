class NotesController < ApplicationController
  before_action :authenticate_user
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = current_user.notes.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @note = current_user.notes.new
  end

  def edit
  end

  def create
    @note = current_user.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Note was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_note
      @note = current_user.notes.find_by(slug: params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :body)
    end
end
