class BookingDecorator < ApplicationDecorator
  delegate_all

  def btn_state(btn)
    if btn == self.state
      "active-#{btn}"
    end
  end

    def colored_playline_state
    count = self.playlines.count
    if count == 0
      "red"
    elsif count > 10
      "green"
    else
      "orange"
    end
  end

  def counted_playline_state
    count = self.playlines.count
    if count > 0
       " (#{count})"
    else
      ""
    end
  end

  def counted_music_state
    count = self.song_choices.count
    if count > 0
      " (#{count})"
    else
      ""
    end
  end

  def colored_music_state
    count = self.song_choices.count
    if count == 0
      "red"
    elsif count >= 3
      "green"
    else
      "orange"
    end
  end

end
