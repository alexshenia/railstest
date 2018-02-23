class ShowController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def page
    show
    render 'page'
  end

  def watch
    if current_user.tickets.where(show_id: params[:id]).present?
      render 'watch'
    else
      flash[:error] = 'You have not access'
      redirect_to root_path
    end
  end
  
  def book
    show
    seast
    render :book
  end

  def book_ticket
    show
    @ticket = @show.tickets.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      redirect_to root_path, success: 'Ticket created'
    else
      seast
      render :book
    end
  end

  def seast
    @seats = Seat.joins(:shows)
               .where(shows: { id: @show.id })
               .where('seats.id NOT IN (SELECT seat_id FROM tickets WHERE tickets.show_id = ?)', @show.id)
  end

  def show
    @show = Show.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:seat_id)
  end
end
