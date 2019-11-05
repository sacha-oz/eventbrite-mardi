class EventsController < ApplicationController
	before_action :authenticate_user, except: [:show, :index]
    #before_action :authenticate_current_user, only: [:edit, ]

  def index
  end

  def show
  	@event = Event.find(params[:id].to_i)
  end

  def new
  end

  def create
  	@event = Event.new(start_date: params[:event_start_date],title: params[:event_title], duration: params[:event_duration], description: params[:event_description], price: params[:event_price], location: params[:event_location]) 
  	puts @event
  	@event.admin = current_user
  	puts @event
  	if @event.save # essaie de sauvegarder en base @gossip
    	flash.now[:success] = 'Bravo tu as bien enregistré ton Gossip !'
    	render :index
    else
    	flash.now[:alert] = "Loupé !"
    	render :new
    end
  end
 
end
