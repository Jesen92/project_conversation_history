class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Projects::Facade.create.new(params: project_params).call

    redirect_to project_url(@project), notice: "Project was successfully created."
  rescue Exceptions::ValidationError => e
    @errors = e.message

    render :new, status: :unprocessable_entity
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    @project = Projects::Facade.update.new(params: project_params, project: @project).call

    redirect_to project_url(@project), notice: "Project was successfully updated."
  rescue Exceptions::ValidationError => e
    @errors = e.message

    render :edit, status: :unprocessable_entity
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    Projects::Facade.destroy.new(project: @project).call
    
    redirect_to projects_url, notice: "Project was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
