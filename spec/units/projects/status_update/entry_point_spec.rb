# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::StatusUpdate::EntryPoint do
  subject { described_class.new(params: params, project: project).call }

  let(:project) { create(:project) }
  let(:params) {
    {
      status: Project::STATUSES.last
    }
  }

  before { project }

  context 'when attributes are valid' do
    it 'updates the project' do
      old_project = project
      expect { subject }.to change(project, :status)
        .from(old_project.status).to(params[:status])
    end
  end

  context 'when attributes are invalid' do
    let(:params) {
      {
        status: 'non_existant_status'
      }
    }

    it_behaves_like 'raises a ValidationError'
  end
end
