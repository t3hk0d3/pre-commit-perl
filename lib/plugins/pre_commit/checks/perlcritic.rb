require 'pre-commit/checks/plugin'

require 'open3'

module PreCommit
  module Checks
    class Perlcritic < Plugin

      FILENAME_WHITELIST_REGEXP = /\.(pm|pl|t)\Z/

      def call(staged_files)
        staged_files = staged_files.grep(FILENAME_WHITELIST_REGEXP)
        return if staged_files.empty?

        args = [] + config_file_flag + user_supplied_flags + staged_files

        stdout, stderr, status = Open3.capture3('/usr/bin/env', perlcritic_bin, *args)

        return if status.success?

        return stdout
      end

      def self.description
        "Asks Perl::Critic to critique your code"
      end

      def config_file_flag
        config_file ? ['-profile', config_file] : []
      end

      def perlcritic_bin
        config.get('perlcritic.bin') || 'perlcritic'
      end

      def user_supplied_flags
        Array(config.get('perlcritic.flags')).reject(&:empty?)
      end

      def alternate_config_file
        '.perlcriticrc'
      end
    end
  end
end
