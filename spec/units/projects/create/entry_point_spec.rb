# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::Create::EntryPoint do
  subject { described_class.new(params:).call }

  context 'when attributes are valid' do
    let(:params) do
      {
        title: 'Title #1',
        description: 'Description Description Description'
      }
    end

    it 'creates a new project' do
      expect { subject }.to change(Project, :count).from(0).to(1)
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
