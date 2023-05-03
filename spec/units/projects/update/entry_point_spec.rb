# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::Update::EntryPoint do
  subject { described_class.new(params:, project:).call }

  let(:project) { create(:project) }
  let(:params) do
    {
      title: 'TitleTitle',
      description: 'DescriptionDescritpion'
    }
  end

  before { project }

  context 'when attributes are valid' do
    it 'updates the project' do
      old_project = project

      expect { subject }.to change(project, :title)
        .from(old_project.title).to(params[:title])
      expect(project.reload.description.body.to_s).to eq(ActionText::RichText.new(name: 'description',
                                                                                  body: params[:description]).body.to_s)
    end
  end

  context 'when attributes are invalid' do
    let(:params) do
      {
        title: nil,
        description: nil
      }
    end

    it_behaves_like 'raises a ValidationError'
  end
end
