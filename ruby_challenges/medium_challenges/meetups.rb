require 'date'

class Meetup
  SCHEDULE = {
    'first'  => (1..7).to_a,
    'second' => (8..14).to_a,
    'third'  => (9..21).to_a,
    'fourth' =>  (22..28).to_a,
    'fifth'  => (29..31).to_a,
    'last'   => (22..31).to_a,
    'teenth' => (13..19).to_a
  }

  def initialize(year, month)
    @year = year
    @month = month
    @last_day = Date.civil(year, month, -1).day
  end

  def day(weekday, schedule)
    weekday, schedule = weekday.downcase, schedule.downcase
    
    day = SCHEDULE[schedule].select do |day|
      next if day > @last_day
      case weekday
      when 'monday'
        Date.new(@year, @month, day).monday?
      when 'tuesday'
        Date.new(@year, @month, day).tuesday?
      when 'wednesday'
        Date.new(@year, @month, day).wednesday?
      when 'thursday'
        Date.new(@year, @month, day).thursday?
      when 'friday'
        Date.new(@year, @month, day).friday?
      when 'saturday'
        Date.new(@year, @month, day).saturday?
      when 'sunday'
        Date.new(@year, @month, day).sunday?
      end
    end

    return nil if day.empty?
    Date.new(@year, @month, day.pop)
  end
end
