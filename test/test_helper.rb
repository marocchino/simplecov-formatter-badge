# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'simplecov'
require 'simplecov-formatter-badge'
SimpleCov.start

require 'minitest/autorun'
