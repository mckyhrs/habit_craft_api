module Api
  module V1
    class HabitsController < ApplicationController
      before_action :set_habit, only: [ :show, :update, :destroy ]

      def index
        render json: Habit.all
      end

      def show
        render json: @habit
      end

      def create
        habit = Habit.new(habit_params)
        if habit.save
          render json: habit, status: :created
        else
          render json: { errors: habit.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @habit.update(habit_params)
          render json: @habit
        else
          render json: { errors: @habit.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @habit.destroy
        head :no_content
      end

      private

      def habit_params
        params.require(:habit).permit(:title, :description)
      end

      def set_habit
        @habit = Habit.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Habit not found" }, status: :not_found
      end
    end
  end
end
