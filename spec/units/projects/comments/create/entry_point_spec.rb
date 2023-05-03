# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::Comments::Create::EntryPoint do
  subject { described_class.new(params:).call }

  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:user_id) { user.id }
  let(:project_id) { project.id }
  let(:body) { 'TextTextText' }
  let(:params) do
    {
      user_id:,
      project_id:,
      body:
    }
  end

  before do
    user
    project
  end

  context 'when attributes are valid' do
    it 'creates a new project' do
      expect { subject }.to change(Projects::Comment, :count).from(0).to(1)
    end
  end

  context 'when attributes are invalid' do
    context 'when user does not exist' do
      let(:user_id) { User.last.id + 10 }

      it_behaves_like 'raises a ValidationError'
    end

    context 'when project does not exist' do
      let(:project_id) { Project.last.id + 10 }

      it_behaves_like 'raises a ValidationError'
    end

    context 'when body is empty' do
      let(:body) { nil }

      it_behaves_like 'raises a ValidationError'
    end
  end
end
