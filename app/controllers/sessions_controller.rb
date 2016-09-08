class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(email: params[:session][:email].downcase)
    if member && member.authenticate(params[:session][:password])
      log_in member
      redirect_to member
      flash[:sucess] = 'Log in bem-sucedido!'
    else
      flash.now[:danger] = 'Usuário ou senha inválidos!'
      render 'new'
    end
  end

  def destroy
  end
end
