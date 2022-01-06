# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe Validators::FileValidator do
  let(:files_dir) { File.join Dir.pwd, 'spec', 'support', 'data' }
  let(:file_path) { File.join files_dir, 'valid.log' }
  let(:file_ext) { '.log' }
  let(:error_prefix) { 'File validation failed:' }

  describe '#validate' do
    subject { Validators::FileValidator.validate(file_path: file_path, file_format: file_ext) }

    context 'when a file is valid' do
      it 'return true' do
        expect { subject }.not_to raise_error
      end
    end

    context 'when a file does not exist' do
      let(:file_path) { '' }

      it 'raise error' do
        expect { subject }.to raise_error "#{error_prefix} File not found."
      end
    end

    context 'when a file has a wrong extension' do
      let(:file_ext) { '.txt' }

      it 'raise error' do
        expect { subject }.to raise_error "#{error_prefix} Invalid file format: '#{file_ext}' expected."
      end
    end

    context 'when a file is empty' do
      before do
        allow(File).to receive(:zero?).and_return(true)
      end

      it 'raise error' do
        expect { subject }.to raise_error "#{error_prefix} File is empty."
      end
    end

    context 'when a file is not readable' do
      before do
        allow(File).to receive(:readable?).and_return(false)
      end

      it 'raise error' do
        expect { subject }.to raise_error "#{error_prefix} File is not readable."
      end
    end
  end
end
