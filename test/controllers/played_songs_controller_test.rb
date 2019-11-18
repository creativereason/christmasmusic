require 'test_helper'

class PlayedSongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @played_song = played_songs(:one)
  end

  test "should get index" do
    get played_songs_url
    assert_response :success
  end

  test "should get new" do
    get new_played_song_url
    assert_response :success
  end

  test "should create played_song" do
    assert_difference('PlayedSong.count') do
      post played_songs_url, params: { played_song: { artist: @played_song.artist, playtime: @played_song.playtime, title: @played_song.title } }
    end

    assert_redirected_to played_song_url(PlayedSong.last)
  end

  test "should show played_song" do
    get played_song_url(@played_song)
    assert_response :success
  end

  test "should get edit" do
    get edit_played_song_url(@played_song)
    assert_response :success
  end

  test "should update played_song" do
    patch played_song_url(@played_song), params: { played_song: { artist: @played_song.artist, playtime: @played_song.playtime, title: @played_song.title } }
    assert_redirected_to played_song_url(@played_song)
  end

  test "should destroy played_song" do
    assert_difference('PlayedSong.count', -1) do
      delete played_song_url(@played_song)
    end

    assert_redirected_to played_songs_url
  end
end
