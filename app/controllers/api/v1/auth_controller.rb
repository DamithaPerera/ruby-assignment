module Api
  module V1
    class AuthController < ApplicationController
      def sign_in
        user = User.find_by(email: sign_in_params[:email])

        if user&.valid_password?(sign_in_params[:password])
          token = Jwt::TokenService.encode(user_id: user.id, exp: token_expiration_time)
          render json: { token: token }, status: :ok
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      rescue StandardError => e
        Rails.logger.error("Sign-in error: #{e.message}")
        render json: { error: 'Internal server error' }, status: :internal_server_error
      end

      def sign_out
        head :no_content
      end

      private

      def sign_in_params
        params.require(:auth).permit(:email, :password)
      end

      def token_expiration_time
        24.hours.from_now.to_i
      end
    end
  end
end
