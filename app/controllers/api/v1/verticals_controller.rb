# class Api::V1::VerticalsController < ApplicationController
# end

# app/controllers/api/v1/verticals_controller.rb
module Api
    module V1
      class VerticalsController < ApplicationController
        before_action :authenticate_user!
        before_action :set_vertical, only: [:show, :update, :destroy]
  
        def index
          @verticals = Vertical.all
          render json: @verticals
        end
  
        def show
          render json: @vertical
        end
  
        def create
          @vertical = Vertical.new(vertical_params)
          if @vertical.save
            render json: @vertical, status: :created
          else
            render json: @vertical.errors, status: :unprocessable_entity
          end
        end
  
        def update
          if @vertical.update(vertical_params)
            render json: @vertical
          else
            render json: @vertical.errors, status: :unprocessable_entity
          end
        end
  
        def destroy
          @vertical.destroy
        end
  
        private
  
        def set_vertical
          @vertical = Vertical.find(params[:id])
        end
  
        def vertical_params
          params.require(:vertical).permit(:name)
        end
      end
    end
  end
  