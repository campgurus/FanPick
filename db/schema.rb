# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151027170449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "event_status"
    t.string   "sport"
    t.string   "start_date_time"
    t.string   "season_type"
    t.integer  "away_team_id"
    t.integer  "home_team_id"
    t.integer  "site_id"
    t.integer  "away_points_scored"
    t.integer  "home_points_scored"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "event_id"
  end

  create_table "mlb_box_scores", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "display_name"
    t.string   "position"
    t.integer  "bat_order"
    t.integer  "sub_bat_order"
    t.integer  "singles"
    t.integer  "doubles"
    t.integer  "triples"
    t.integer  "hits"
    t.integer  "rbi"
    t.integer  "sacrifices"
    t.integer  "at_bats"
    t.integer  "plate_appearances"
    t.integer  "home_runs"
    t.integer  "sac_flies"
    t.integer  "sac_hits"
    t.integer  "stolen_bases"
    t.integer  "caught_stealing"
    t.integer  "rbi_with_two_outs"
    t.integer  "total_bases"
    t.integer  "runs"
    t.integer  "walks"
    t.integer  "strike_outs"
    t.integer  "left_on_base"
    t.integer  "hit_by_pitch"
    t.string   "team_abbreviation"
    t.float    "avg"
    t.float    "obp"
    t.float    "slg"
    t.float    "ops"
    t.float    "at_bats_per_home_run"
    t.float    "at_bats_per_rbi"
    t.float    "walk_rate"
    t.float    "plate_appearances_per_rbi"
    t.float    "plate_appearances_per_home_run"
    t.integer  "extra_base_hits"
    t.float    "stolen_base_average"
    t.float    "strike_out_rate"
    t.string   "ops_string"
    t.string   "slg_string"
    t.string   "obp_string"
    t.string   "avg_string"
    t.string   "batting_highlights"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "event_id"
  end

  create_table "nba_box_scores", force: :cascade do |t|
    t.string   "position"
    t.integer  "minutes"
    t.integer  "points"
    t.integer  "assists"
    t.integer  "turnovers"
    t.integer  "steals"
    t.integer  "blocks"
    t.integer  "rebounds"
    t.integer  "field_goals_attempted"
    t.integer  "field_goals_made"
    t.integer  "three_point_field_goals_attempted"
    t.integer  "three_point_field_goals_made"
    t.integer  "free_throws_attempted"
    t.integer  "free_throws_made"
    t.integer  "defensive_rebounds"
    t.integer  "offensive_rebounds"
    t.integer  "personal_fouls"
    t.integer  "team_id"
    t.boolean  "is_starter"
    t.float    "field_goal_percentage"
    t.float    "three_point_percentage"
    t.float    "free_throw_percentage"
    t.string   "field_goal_percentage_string"
    t.string   "three_point_field_goal_percentage_string"
    t.string   "free_throw_percentage_string"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "event_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.integer  "capacity"
    t.string   "surface"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "team_id"
    t.string   "abbreviation"
    t.boolean  "active"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "conference"
    t.string   "division"
    t.string   "site_name"
    t.string   "city"
    t.string   "state"
    t.string   "full_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
