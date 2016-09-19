class MembersController < ApplicationController
  skip_before_action :verify_authenticity_token if Rails.env.test?
  before_action :authenticate_member, except: [:new, :create]

  def new
    @member = Member.new
  end

  def index
    @members = Member.all
  end
  def show
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to members_path
    else
      flash[:alert] = "Member not created"
      render 'new'
    end
  end

  def update
    @member = Member.find(params[:id])

    if @member.update_attributes(member_params)
      redirect_to members_path
    else
      flash[:alert] = "Member not updated"
      render 'edit'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to members_path
  end



  private

    def member_params
      params.require(:member).permit(:name, :alias, :password, :email, :password_confirmation)
    end

end
