# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Projects::Facade.create.new(params: project_params).call

    redirect_to project_url(@project), notice: 'Project was successfully created.'
  rescue Exceptions::ValidationError => e
    @errors = e.message

    render :new
  end

  def update
    @project = Projects::Facade.update.new(params: project_params, project: @project).call

    redirect_to project_url(@project), notice: 'Project was successfully updated.'
  rescue Exceptions::ValidationError => e
    @errors = e.message

    render :edit
  end

  def destroy
    Projects::Facade.destroy.new(project: @project).call

    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  rescue Projects::Facade.destroy::ProjectHasHistory
    redirect_to project_url(@project), notice: 'Project with any activity can not be deleted'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
