class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(room_params)

      if @room.save
        redirect_to rooms_path
      else
        flash[:alert] = "Sala não foi criada"
        render 'new'
      end
    end

    def update
      @room = Room.find(params[:id])

      if @room.update_attributes(room_params)
        redirect_to room_path
      else
        flash[:alert] = "Erro na atualização da sala"
        render 'edit'
      end
    end

  def destroy 
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_path    
  end

  private
    def room_params
      params.require(:room).permit(:name)
    end

end
