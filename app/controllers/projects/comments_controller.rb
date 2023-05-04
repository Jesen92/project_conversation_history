# frozen_string_literal: true

module Projects
  class CommentsController < ApplicationController
    before_action :set_project, only: :create

    def create
      Projects::Facade.comment_create.new(params: projects_comment_params, current_user:).call
      notice = 'Comment was successfully created.'
    rescue Exceptions::ValidationError => e
      @errors = e.message
      notice = 'Error while creating a comment.'
    ensure
      redirect_to project_path(@project), notice:
    end

    def destroy
      comment = Projects::Comment.find(params[:id])
      project = comment.project
      Projects::Facade.comment_destroy.new(comment:, current_user:).call

      redirect_to project_url(project), notice: 'Comment was successfully destroyed.'
    end

    private

    def set_project
      @project = Project.find(projects_comment_params[:project_id])
    end

    def projects_comment_params
      params.require(:projects_comment).permit(:project_id, :body)
    end
  end
end
