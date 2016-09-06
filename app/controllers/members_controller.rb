class MembersController < ApplicationController

  def new
    @member = member.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:sucess] = "O usuário foi deletado"
  end

  def show
  @user = User.find(params[:id])
  end

  def create
    @user = User.find(params[:id])

    if @user.save
      flash[:sucess] = "O usuário foi criado com sucesso"

    else
      flash[:sucess] = "Houve um erro na criação do usuário"
    end
  end

  def index
    @members = Member.all
  end
end
