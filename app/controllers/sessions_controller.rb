class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token if Rails.env.test?
  def new
  end

  def create
    member = Member.find_by(email: params[:session][:email].downcase)
    if member && member.authenticate(params[:session][:password])
      log_in member
      redirect_to member
      flash[:success] = 'Log in bem-sucedido!'
    else
      flash.now[:danger] = 'Usuário ou senha inválidos!'
      render 'new'
    end
  end

  def destroy
    if current_member
      log_out
    end
    redirect_to rooms_path
  end
end
