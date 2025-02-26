if application "Spotify" is running then
  tell application "Spotify"
    set theArtist to artist of the current track

    try
      return "Spotify: " & theArtist
    on error err
    end try
  end tell
end if
