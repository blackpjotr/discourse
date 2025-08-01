# frozen_string_literal: true

# This file is auto-generated from the IntermediateDB schema. To make changes,
# update the "config/intermediate_db.yml" configuration file and then run
# `bin/cli schema generate` to regenerate this file.

module Migrations::Database::IntermediateDB
  module CategoryUser
    SQL = <<~SQL
      INSERT INTO category_users (
        category_id,
        user_id,
        last_seen_at,
        notification_level
      )
      VALUES (
        ?, ?, ?, ?
      )
    SQL

    def self.create(category_id:, user_id:, last_seen_at: nil, notification_level:)
      ::Migrations::Database::IntermediateDB.insert(
        SQL,
        category_id,
        user_id,
        ::Migrations::Database.format_datetime(last_seen_at),
        notification_level,
      )
    end
  end
end
