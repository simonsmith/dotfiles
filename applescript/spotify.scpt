if application "Spotify" is running then
  tell application "Spotify"
    set theName to name of the current track
    set theArtist to artist of the current track
    set theAlbum to album of the current track
    set theUrl to spotify url of the current track

    try
      return "Spotify: " & theName & " by " & theArtist
    on error err
    end try
  end tell
end if