
module Validators
  # Validates a file by its path and format
  class VisitsFileValidator < FileValidator
    private

    def valid_file?
      super && valid_content?
    end

    def valid_content?
      file = File.new file_path
      file.each do |line|
        return false unless valid_line?(line, file.lineno)
      end

      true
    end

    def valid_line?(line, lineno)
      params = line.split
      params.length > 1 &&
        params[0] =~ /\/\w+/ &&
        params[1] =~ /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/ ||
        add_message_and_fail("Content is invalid! #{File.basename(file_path)}:#{lineno}")
    end
  end
end
