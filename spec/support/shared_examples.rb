# frozen_string_literal: true

RSpec.shared_examples 'raises a ValidationError' do
  it 'raises a ValidationError' do
    expect { subject }.to raise_error Exceptions::ValidationError
  end
end
