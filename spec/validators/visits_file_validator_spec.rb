# frozen_string_literal: true

require_relative File.join(Dir.pwd, 'spec/support/spec_helper')

RSpec.describe Validators::VisitsFileValidator do
  let(:files_dir) { File.join Dir.pwd, 'spec', 'support', 'data' }
  let(:file_path) { File.join files_dir, 'valid.log' }
  let(:file_ext) { '.log' }
  let(:error_prefix) { 'File validation failed: Content is invalid!' }

  describe '#validate' do

    context 'when a file is valid' do
      subject { Validators::VisitsFileValidator.validate(file_path: file_path, file_format: file_ext) }
      it 'return true' do
        expect { subject }.not_to raise_error
      end
    end

    context 'when file is invalid' do
      subject do
        Validators::VisitsFileValidator.validate(
          file_path: invalid_file_path,
          file_format: file_ext
        )
      end

      context 'when page format is wrong' do
        let(:invalid_file_path) { File.join files_dir, 'invalid_page.log' }

        it 'raise error' do
          error = "#{error_prefix} #{File.basename(invalid_file_path)}:3"
          expect { subject }.to raise_error error
        end
      end

      context 'when ip address is wrong' do
        let(:invalid_file_path) { File.join files_dir, 'invalid_ip_address.log' }

        it 'raise error' do
          error = "#{error_prefix} #{File.basename(invalid_file_path)}:4"
          expect { subject }.to raise_error error
        end
      end

      context 'when a line has one parameter' do
        let(:invalid_file_path) { File.join files_dir, 'invalid_line.log' }

        it 'raise error' do
          error = "#{error_prefix} #{File.basename(invalid_file_path)}:2"
          expect { subject }.to raise_error error
        end
      end

      context 'when a line is empty' do
        let(:invalid_file_path) { File.join files_dir, 'empty_line.log' }

        it 'raise error' do
          error = "#{error_prefix} #{File.basename(invalid_file_path)}:5"
          expect { subject }.to raise_error error
        end
      end
    end
  end
end
