class RoomsController < ApplicationController
  before_action :authenticate_member, only: [:signup]
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def signup
    @user = current_member
    @room = Room.find(params[:id])
    @membership = Membership.new(member_id: @user.id, room_id: params[:id])

    if @membership.save
      flash[:sucess] = "Cadastrado com sucesso"
      redirect_to rooms_path
    else
      flash[:alert] = "Deu merda"
      redirect_to rooms_path
    end
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
