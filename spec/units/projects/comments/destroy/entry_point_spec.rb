# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Projects::Comments::Destroy::EntryPoint do
  subject { described_class.new(comment:, current_user:).call }

  let(:comment) { create(:comment) }
  let(:current_user) { comment.user }

  before { comment }

  it 'destroys a comment' do
    expect { subject }.to change(Projects::Comment, :count).from(1).to(0)
  end

  context 'when other users comment' do
    let(:current_user) { create(:user) }

    it 'raises an error' do
      expect { subject }.to raise_error
    end
  end
end
