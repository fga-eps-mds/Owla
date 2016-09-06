class MembersController < ApplicationController

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:sucess] = "O usuário foi deletado"
  end

  def show
  @member = Member.find(params[:id])
  end

  def create
    @member = Member.find(params[:id])

    if @member.save
      flash[:sucess] = "O usuário foi criado com sucesso"

    else
      flash[:sucess] = "Houve um erro na criação do usuário"
    end
  end

  def update
    @member = member.find(params[:id])

    if @member.update_atributes(member_params)
      flash[:sucess] = "As informações do usuário foram atualizadas com sucesso"
    else
      flash[:sucess] = "Houve um erro na atualização das informações do usuário"
    end
  end

  def index
    @members = Member.all
  end

  private

    def member_params
      params.require(:member).permit(:name, :alias, :password, :email)
    end

end
