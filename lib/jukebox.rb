class Jukebox

  attr_accessor :songs

  def initialize(songs)
    @songs = songs
  end

  def call # this is our runner
    "Welcome!\n\n Please enter your command:"
    command = gets.strip
    case command
      when "play"
        play
      when /play+ /
        song = command.split("play").last
        play(song)
      when "help"
        help
      when "list"
        list
      when "exit"
        exit
    end # end case
  end # end call method

  def play(song = nil)
    if song == nil
      puts "What would you like to listen to?"
      song = gets.strip
    end # end if

    if song.to_i.to_s == song
      puts "Now Playing: #{@songs[song.to_i - 1]}."
    else
      puts "Now Playing: #{song}."
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