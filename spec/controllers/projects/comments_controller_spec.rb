# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  before do
    project
    sign_in user
  end

  describe 'POST create' do
    let(:new_comment) do
      {
        projects_comment: {
          project_id: project.id,
          body:
        }
      }
    end
    let(:body) { 'New comment' }

    it 'creates a new project' do
      expect {
        post :create, params: new_comment
      }.to change(Projects::Comment, :count).by(1)
    end

    it 'renders the show template' do
      post :create, params: new_comment
      expect(response).to redirect_to(project_path(Project.last))
    end

    context 'when create raises an Exception::ValidationError' do
      let(:body) { nil }

      it 'renders the new template' do
        post :create, params: new_comment
        expect(response).to redirect_to(project_path(Project.last))
      end
    end
  end

  describe 'DELETE destroy' do
    let(:comment) { create(:comment, user:) }

    before { comment }

    it 'deletes a project' do
      expect {
        delete :destroy, params: { id: comment }
      }.to change(Projects::Comment, :count).by(-1)
    end

    it 'renders the show template' do
      delete :destroy, params: { id: comment }
      expect(response).to redirect_to(project_path(Project.last))
    end
  end
end
