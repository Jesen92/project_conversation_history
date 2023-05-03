# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::Destroy::EntryPoint do
  subject { described_class.new(project:).call }

  let(:project) { create(:project) }

  before { project }

  it 'destroys a project' do
    expect { subject }.to change(Project, :count).from(1).to(0)
  end
end
