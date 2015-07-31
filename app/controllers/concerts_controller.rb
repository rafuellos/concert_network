class ConcertsController < ApplicationController
  

  def index
    
    @concerts_today =  Concert.where(:date => Date.today)
    @concerts_this_month = Concert.order(date: :asc).where(:date => Date.today + 1.day..(Date.today + 1.day).end_of_month) - @concerts_today
    #binding.pry

    #@concerts = Concert.show_concerts(50)

    if @concerts_today.empty?
      render template: 'concerts/no_concerts'
    end
  end

  def show
    unless @concert = Concert.find_by(id: params[:id])
      render 'no_concert_found'
    end
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new concert_params
    

    if @concert.save
      flash[:notice] = 'The concert was created successfully'
      redirect_to concerts_path
    else
     @errors = @concert.errors.full_messages
     flash.now[:alert] = "The concert can't be created"
     render 'new'
    end
  end


  def edit
    @concert = Concert.find params[:id]
   
  end

  def update
    @concert = Concert.find params[:id]
    

    if @concert.update_attributes concert_params
      redirect_to front_page_path(@concert.id)
    else
      @errors = @concert.errors.full_messages
      render 'edit'
    end
  end

  private
  def concert_params
    params.require(:concert).permit(:date, :band, :venue, :city, :price, :description)
  end

end
