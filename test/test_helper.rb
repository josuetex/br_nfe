# encoding: UTF-8
require 'bundler/setup'
Bundler.require(:default, :test)

ENV["RAILS_ENV"] = "test"
require "rails/test_help"
require 'minitest/autorun'
require "minitest/rails"
require 'minitest/matchers_vaccine'

require 'shoulda/matchers'
require "minitest/reporters"
require 'mocha/mini_test'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start


require 'factory_girl_rails'

require 'pry'

require "savon/mock/spec_helper"

Minitest::Reporters.use!

if ActiveSupport.version >= Gem::Version.new('4.2')
	ActiveSupport::TestCase.test_order = :sorted
end

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
FactoryGirl.find_definitions

class Module
	include Minitest::Spec::DSL
end

class Object
  alias context describe
end

class MiniTest::Spec
	include Savon::SpecHelper
	include Shoulda::Matchers::ActiveModel
	include FactoryGirl::Syntax::Methods
	let(:sequence_1) { sequence('sequence_1') } 
end