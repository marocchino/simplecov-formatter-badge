# frozen_string_literal: true

require 'test_helper'

module SimpleCov
  module Formatter
    class BadgeFormatterTest < Minitest::Test
      class Result
        attr_reader :covered_percent

        def initialize(covered_percent)
          @covered_percent = covered_percent
        end
      end

      def test_format
        formatter = SimpleCov::Formatter::BadgeFormatter.new

        formatter.format(Result.new('100'))
        actual = File.read(formatter.result_file_path)
        assert_match(/#4c1/, actual)

        formatter.format(Result.new('90'))
        actual = File.read(formatter.result_file_path)
        assert_match(/#dfb317/, actual)

        formatter.format(Result.new('80'))
        actual = File.read(formatter.result_file_path)
        assert_match(/#e05d44/, actual)
      end
    end
  end
end
