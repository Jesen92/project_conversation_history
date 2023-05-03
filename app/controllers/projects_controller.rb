# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.includes(:comments).all
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

    render :new, status: :unprocessable_entity
  end

  def update
    @project = Projects::Facade.update.new(params: project_params, project: @project).call

    redirect_to project_url(@project), notice: 'Project was successfully updated.'
  rescue Exceptions::ValidationError => e
    @errors = e.message

    render :edit, status: :unprocessable_entity
  end

  def destroy
    Projects::Facade.destroy.new(project: @project).call

    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
