require 'pre-commit/checks/plugin'

module PreCommit
  module Checks
    class Perl < Plugin

      def self.includes
        [:perlcritic]
      end

      def self.description
        "Plugins common for Perl programming language."
      end
    end
  end
end
