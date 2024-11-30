# frozen_string_literal: true

class SchedulesController < ApplicationController
  def index = render(Views::Schedules::Index.new)

  def create
    Schedule.create!(schedule_params)
    redirect_to(root_path)
  end

  private

  def schedule_params = params.require(:schedule).permit(:scheduled_at)
end
