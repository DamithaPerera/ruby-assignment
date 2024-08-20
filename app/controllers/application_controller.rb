class ApplicationController < ActionController::API
  def current_user
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    decoded = Jwt::TokenService.decode(token) rescue nil
    User.find(decoded['user_id']) if decoded
  end

  def authenticate_user!
    render json: { error: 'Unauthorized' }, status: :unauthorized unless current_user
  end
end
