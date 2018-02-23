class MovieController < ApplicationController
  protect_from_forgery with: :exception

  def index
    schedule
    render :index
  end

  def schedule
    @days = 6
    @schedule = {}
    @week_days = (Time.zone.today..Time.zone.today + @days).to_a
    @movies = Movie.distinct.includes(shows: :hall).joins(:shows)
                .where('DATE(shows.start_at) BETWEEN ? AND ?', @week_days.first, @week_days.last).order('shows.start_at ASC')
    build_schedule!
  end

  def build_schedule!
    @movies.each do |movie|
      setup_schedule(movie)
      shows_grouped_by_date(movie).each do |date, shows_by_date|
        shows_grouped_hall(shows_by_date).each do |key, shows|
          @schedule[movie][date].merge!({ key => shows })
        end
      end
    end
  end

  def setup_schedule(movie)
    @schedule.merge!(movie => @week_days.inject({}) { |a, e| a.merge!(e => {}) })
  end

  def shows_grouped_by_date(movie)
    movie.shows.group_by { |s| s.start_at.to_date }
  end

  def shows_grouped_hall(shows)
    shows.group_by { |show| show.hall.name }
  end
end
