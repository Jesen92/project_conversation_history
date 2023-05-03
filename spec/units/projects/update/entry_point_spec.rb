# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::Update::EntryPoint do
  subject { described_class.new(params: params, project: project).call }

  let(:project) { create(:project) }
  let(:params) {
    {
      title: 'TitleTitle',
      description: 'DescriptionDescritpion'
    }
  }

  before { project }

  context 'when attributes are valid' do
    it 'updates the project' do
      old_project = project
      expect { subject }.to change(project, :title)
        .from(old_project.title).to(params[:title])
        .and change(project,
                    :description)
        .from(old_project.description)
        .to(params[:description])
    end
  end

  context 'when attributes are invalid' do
    let(:params) {
      {
        title: nil,
        description: nil
      }
    }

    it_behaves_like 'raises a ValidationError'
  end
end
