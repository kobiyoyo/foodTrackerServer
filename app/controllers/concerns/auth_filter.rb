module AuthFilter
  def authorize_admin
    return if current_user.admin?

    response = { message: 'Only Admin can have access!' }
    render json: response
  end
end
