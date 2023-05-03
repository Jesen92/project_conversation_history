class Projects::StatusesController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  def update
    @project = Projects::Facade.status_update.new(params: status_params, project: @project).call
    notice = 'Project status was successfully updated.'

  rescue Exceptions::ValidationError => e
    @errors = e.message
    notice = 'Error while updating the status'
  ensure
    redirect_to project_url(@project), notice: notice
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def status_params
    params.require(:project).permit(:status)
  end
end
