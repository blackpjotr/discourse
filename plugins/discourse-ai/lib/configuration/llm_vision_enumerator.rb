# frozen_string_literal: true

require "enum_site_setting"

module DiscourseAi
  module Configuration
    class LlmVisionEnumerator < ::EnumSiteSetting
      def self.valid_value?(val)
        true
      end

      def self.values
        values = DB.query_hash(<<~SQL).map(&:symbolize_keys)
          SELECT display_name AS name, id AS value
          FROM llm_models
          WHERE vision_enabled
        SQL

        values
      end
    end
  end
end
