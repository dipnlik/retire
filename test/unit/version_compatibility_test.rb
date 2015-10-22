# encoding: UTF-8

# TODO move these tests to more appropriate locations

require 'test_helper'

class ModelWithMapping
  extend  ActiveModel::Naming
  include Tire::Model::Search
  include Tire::Model::Callbacks

  tire do
    mapping do
      indexes :title
    end
  end
end

module Tire

    class VersionCompatibilityTest < Test::Unit::TestCase

      context "index#get_mapping" do

        should "return the expected hash" do
          result = ModelWithMapping.index.get_mapping
          assert result.has_key?("model_with_mapping"), result.inspect
        end

      end

    end

end
