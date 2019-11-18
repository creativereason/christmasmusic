class PlayedSongsController < ApplicationController
  before_action :set_played_song, only: [:show, :edit, :update, :destroy]

  # GET /played_songs
  # GET /played_songs.json
  def index
    @played_songs = PlayedSong.all
  end

  # GET /played_songs/1
  # GET /played_songs/1.json
  def show
  end

  # GET /played_songs/new
  def new
    @played_song = PlayedSong.new
  end

  # GET /played_songs/1/edit
  def edit
  end

  # POST /played_songs
  # POST /played_songs.json
  def create
    @played_song = PlayedSong.new(played_song_params)

    respond_to do |format|
      if @played_song.save
        format.html { redirect_to @played_song, notice: 'Played song was successfully created.' }
        format.json { render :show, status: :created, location: @played_song }
      else
        format.html { render :new }
        format.json { render json: @played_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /played_songs/1
  # PATCH/PUT /played_songs/1.json
  def update
    respond_to do |format|
      if @played_song.update(played_song_params)
        format.html { redirect_to @played_song, notice: 'Played song was successfully updated.' }
        format.json { render :show, status: :ok, location: @played_song }
      else
        format.html { render :edit }
        format.json { render json: @played_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /played_songs/1
  # DELETE /played_songs/1.json
  def destroy
    @played_song.destroy
    respond_to do |format|
      format.html { redirect_to played_songs_url, notice: 'Played song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_played_song
      @played_song = PlayedSong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def played_song_params
      params.require(:played_song).permit(:title, :artist, :playtime)
    end
end
