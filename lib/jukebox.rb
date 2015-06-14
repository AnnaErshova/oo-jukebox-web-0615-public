class Jukebox

  attr_accessor :songs

  def initialize(songs)
    @songs = songs
  end

  def call # this is our runner
    "Welcome to the Object-oriented Jukebox!\n\n You can type play to go to the play menu, type play number of the song you's like to listen to, type play the name of the song you'd like to listen to\n\n. Alternatively, type help, list, or exit. \n\n. Please enter your command:"
    command = gets.strip
    
    case command
      when "play" # if just 'play', then plays a song
        play
      when /play+ /
        song = command.split("play ").last # need to remember the blank space there as it was throwing me off
        play_song(song)
      when "help"
        help
      when "list"
        list
      when "exit"
        exit
    end # end case

  end # end call method

  # broke play method into 3 methods to obey the single responsibililty principle

  def play(song = nil)
    if song == nil # if no song specified
      puts "What would you like to listen to?"
      song = gets.strip
      play_song(song)
    end # end if
    play_song(song)
  end

  def play_song(song)
    if song.to_i.to_s == song # if song is a number
      puts "Now Playing: #{@songs[song.to_i - 1]}" # plays a song of that number
    else # is song is a title
      puts "Now Playing: #{song}"
    end # end nested if
  end # end play

  def list
    puts @songs
  end

  def help
    puts "You are currently in the help menu.
    Enter play to play a song.
    Enter list to show a list of songs
    Enter exit to exit the Jukebox"
    # (/^(?=.*help)(?=.*list)(?=.*play)(?=.*exit).+/m)
      # expected "" to match /^(?=.*help)(?=.*list)(?=.*play)(?=.*exit).+/m
  end

  def exit
    exit
  end

end # end class 