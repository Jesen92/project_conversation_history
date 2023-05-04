# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::StatusUpdate::EntryPoint do
  subject { described_class.new(params:, project:, current_user: user).call }

  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:params) do
    {
      status: Project::STATUSES.last
    }
  end

  before do
    user
    project
  end

  context 'when attributes are valid' do
    it 'updates the project' do
      old_project = project
      expect { subject }.to change(project, :status)
        .from(old_project.status).to(params[:status])
        .and change(Projects::Status, :count).from(0).to(1)
    end
  end

  context 'when attributes are invalid' do
    let(:params) do
      {
        status: 'non_existant_status'
      }
    end

    it_behaves_like 'raises a ValidationError'
  end
end
