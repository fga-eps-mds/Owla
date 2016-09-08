module SessionsHelper

  def log_in(member)
    session[:member_id] = member.id
  end

  def current_member
    @current_member ||= Member.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:member_id)
    @current_member = nil
  end
end
