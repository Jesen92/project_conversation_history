# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::StatusesController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  before do
    project
    sign_in user
  end

  describe 'PATCH update' do
    let(:status_update) do
      {
        id: project,
        project: {
          status:
        }
      }
    end
    let(:status) { Project::STATUSES.last }

    it 'creates a new project' do
      expect {
        patch :update, params: status_update
      }.to change(Projects::Status, :count).by(1)
      expect(project.reload.status).to eq(status)
    end

    it 'renders the show template' do
      patch :update, params: status_update
      expect(response).to redirect_to(project_path(Project.last))
    end

    context 'when create raises an Exception::ValidationError' do
      let(:status) { 'non-existing-status' }

      it 'renders the new template' do
        patch :update, params: status_update
        expect(response).to redirect_to(project_path(Project.last))
      end
    end
  end
end
