module Api
  module V1
    class SearchController < ApplicationController
      def index
        query = params[:q]
        if query.present?
          verticals = Vertical.search(query).records.to_a
          categories = Category.search(query).records.to_a
          courses = Course.search(query).records.to_a

          render json: {
            verticals: verticals,
            categories: categories,
            courses: courses
          }
        else
          render json: { error: 'No query parameter provided' }, status: :bad_request
        end
      end
    end
  end
end
