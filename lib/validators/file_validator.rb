# frozen_string_literal: true

module Validators
  # Validates a file by its path and format
  class FileValidator
    def self.validate(file_path:, file_format:)
      new(path: file_path, format: file_format).validate_file
    end

    def initialize(path:, format:)
      @file_path = path
      @file_format = format
      @message = ''
    end

    def validate_file
      return true if valid_file?

      raise StandardError, "File validation failed: #{message}"
    end

    private

    attr_reader :file_path, :file_format
    attr_accessor :message

    def valid_file?
      exist? && readable? && not_empty? && valid_format?
    end

    def exist?
      (@file_path && File.exist?(@file_path) && !File.directory?(@file_path)) ||
        add_message_and_fail('File not found.')
    end

    def readable?
      File.readable?(@file_path) ||
        add_message_and_fail('File is not readable.')
    end

    def not_empty?
      !File.zero?(@file_path) ||
        add_message_and_fail('File is empty.')
    end

    def valid_format?
      File.extname(@file_path) == @file_format ||
        add_message_and_fail("Invalid file format: '#{@file_format}' expected.")
    end

    def add_message_and_fail(message)
      self.message = message
      false
    end
  end
end
