module SessionsHelper

  def log_in(member)
    session[:member_id] = member.id    
  end
end
