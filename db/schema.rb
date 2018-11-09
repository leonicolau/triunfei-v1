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

ActiveRecord::Schema.define(version: 2018_10_13_144632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :serial, force: :cascade do |t|
    t.integer "bank_id"
    t.string "name"
    t.decimal "taxes", precision: 8, scale: 2
    t.decimal "minimum_rent", precision: 8, scale: 2
    t.decimal "minimum_deposit", precision: 8, scale: 2
    t.text "benefits"
    t.string "link"
    t.string "slug"
    t.string "service_packages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.integer "withdrawal"
    t.integer "transfer"
    t.integer "statement"
    t.datetime "deleted_at"
    t.boolean "active", default: true
    t.string "wizard_1"
    t.string "wizard_2"
    t.string "wizard_3"
    t.string "wizard_link"
    t.integer "max_daily_redirect"
    t.boolean "highlighted", default: false
    t.index ["deleted_at"], name: "index_accounts_on_deleted_at"
  end

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  end

  create_table "admin_profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "admin_profile_id"
    t.index ["admin_profile_id"], name: "index_admin_users_on_admin_profile_id"
    t.index ["deleted_at"], name: "index_admin_users_on_deleted_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "admin_users_tags", force: :cascade do |t|
    t.bigint "admin_user_id"
    t.bigint "tag_id"
    t.index ["admin_user_id"], name: "index_admin_users_tags_on_admin_user_id"
    t.index ["tag_id"], name: "index_admin_users_tags_on_tag_id"
  end

  create_table "automated_landing_pages", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "landing_page_type"
    t.string "slug"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.text "card_description"
    t.string "utm_source", default: "triunfei"
    t.string "affiliate_link"
    t.string "card_postback_url"
    t.datetime "deleted_at"
    t.string "account_postback_url"
    t.string "loan_postback_url"
    t.boolean "show_at_wizard", default: false
    t.text "card_bank_description"
    t.text "loan_bank_description"
    t.text "account_bank_description"
    t.boolean "show_in_filter", default: true
    t.index ["deleted_at"], name: "index_banks_on_deleted_at"
  end

  create_table "banks_user_wizards", id: :serial, force: :cascade do |t|
    t.integer "bank_id"
    t.integer "user_wizard_id"
    t.index ["bank_id"], name: "index_banks_user_wizards_on_bank_id"
    t.index ["user_wizard_id"], name: "index_banks_user_wizards_on_user_wizard_id"
  end

  create_table "blog_posts", id: :serial, force: :cascade do |t|
    t.integer "original_post_id"
    t.string "title"
    t.string "url"
    t.boolean "visible", default: false
    t.datetime "published_at"
    t.string "summary"
    t.string "content"
    t.integer "position"
    t.integer "post_type"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_blog_posts_on_deleted_at"
  end

  create_table "brokers", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "cards", id: :serial, force: :cascade do |t|
    t.integer "bank_id"
    t.string "name"
    t.integer "card_type"
    t.string "bank_usp1"
    t.string "bank_usp2"
    t.string "discount"
    t.string "points"
    t.string "design"
    t.boolean "international", default: false
    t.string "insurance"
    t.string "flag_call_center"
    t.string "flag_prem1"
    t.string "flag_prem2"
    t.string "flag_prem3"
    t.string "flag_prem4"
    t.string "anuity_discount"
    t.decimal "anuity", precision: 8, scale: 2
    t.integer "anuity_multiple"
    t.decimal "minimum_rent", precision: 8, scale: 2
    t.decimal "interest_rate"
    t.integer "flag_id"
    t.string "link"
    t.string "insurance2"
    t.string "slug"
    t.string "string"
    t.integer "order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean "active", default: true
    t.datetime "deleted_at"
    t.string "anuity_description"
    t.string "landing_url"
    t.integer "air_miles"
    t.string "wizard_link"
    t.string "modal_name"
    t.string "title_modal_box"
    t.string "company_name"
    t.text "text_of_column_one"
    t.text "text_of_column_two"
    t.text "text_of_column_three"
    t.decimal "monthly_recharge"
    t.string "wizard_1"
    t.string "wizard_2"
    t.string "wizard_3"
    t.integer "max_daily_redirect"
    t.string "devices"
    t.boolean "highlighted", default: false
    t.text "description_promo"
    t.index ["deleted_at"], name: "index_cards_on_deleted_at"
  end

  create_table "cell_phone_plans", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "plan_type"
    t.text "description"
    t.integer "minutes"
    t.decimal "price", precision: 8, scale: 2
    t.string "link"
    t.integer "gb"
    t.string "description_brand"
    t.string "slug"
    t.integer "order", default: 0
    t.integer "operator_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "wizard_3"
    t.string "wizard_2"
    t.string "wizard_1"
    t.integer "max_daily_redirect"
    t.boolean "highlighted", default: false
    t.index ["operator_id"], name: "index_cell_phone_plans_on_operator_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "uf_id"
    t.string "slug"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consortia", force: :cascade do |t|
    t.string "name"
    t.text "benefits"
    t.decimal "value", precision: 8, scale: 2
    t.decimal "payment_term", precision: 8, scale: 2
    t.decimal "monthly_installment", precision: 8, scale: 2
    t.string "link"
    t.string "slug"
    t.bigint "insurer_id"
    t.integer "insurance_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "deleted_at"
    t.boolean "highlighted", default: false
    t.index ["insurer_id"], name: "index_consortia_on_insurer_id"
  end

  create_table "countries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "domains"
    t.string "locale"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show_blog", default: false
    t.boolean "show_modal_button", default: false
    t.boolean "show_banner"
    t.boolean "show_cell_phone_plans"
  end

  create_table "country_destinies", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.integer "discount_percentage"
    t.string "coupon_code"
    t.string "term"
    t.text "rule"
    t.bigint "store_id"
    t.string "link"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["store_id"], name: "index_coupons_on_store_id"
  end

  create_table "flags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_flags_on_deleted_at"
  end

  create_table "insurance_cars", force: :cascade do |t|
    t.string "name"
    t.text "benefits"
    t.string "link"
    t.string "slug"
    t.bigint "insurer_id"
    t.integer "manufacturer_id"
    t.datetime "deleted_at"
    t.integer "insurance_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean "highlighted", default: false
    t.index ["insurer_id"], name: "index_insurance_cars_on_insurer_id"
  end

  create_table "insurance_travels", force: :cascade do |t|
    t.string "name"
    t.text "benefits"
    t.string "link"
    t.string "slug"
    t.bigint "insurer_id"
    t.datetime "deleted_at"
    t.integer "insurance_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer "country_destiny_id"
    t.boolean "highlighted", default: false
    t.index ["insurer_id"], name: "index_insurance_travels_on_insurer_id"
  end

  create_table "insurance_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insurances", force: :cascade do |t|
    t.string "name"
    t.text "benefits"
    t.string "link"
    t.string "slug"
    t.bigint "insurer_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer "insurance_type_id"
    t.integer "order"
    t.boolean "highlighted", default: false
    t.index ["insurer_id"], name: "index_insurances_on_insurer_id"
  end

  create_table "insurers", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "investments", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "fixed_remuneration"
    t.text "description"
    t.integer "broker_id"
    t.string "link"
    t.datetime "deleted_at"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer "investment_term"
    t.decimal "gross_profitability", precision: 8, scale: 2
    t.decimal "expected_return", precision: 8, scale: 2
    t.decimal "profitability", precision: 8, scale: 2
    t.integer "duration"
    t.integer "type_of_profitability"
    t.integer "order", default: 0
    t.integer "bank_id"
    t.string "indexer"
    t.decimal "minimum_investment_value", precision: 8, scale: 2
    t.boolean "fgc_guarantee", default: false
    t.decimal "yearly_profitability_value", precision: 8, scale: 2
    t.decimal "net_profitability_value", precision: 8, scale: 2
    t.string "product_category"
    t.decimal "savings_profitability_value", precision: 8, scale: 2
    t.decimal "gross_return_expectation_value", precision: 8, scale: 2
    t.decimal "net_return_expectation_value", precision: 8, scale: 2
    t.decimal "year_return_expectation_value", precision: 8, scale: 2
    t.decimal "gain_over_savings", precision: 8, scale: 2
    t.string "profitability_category_name"
    t.integer "bank_score"
    t.integer "daily_deadline"
    t.text "product_category_description"
    t.decimal "cdi_return"
    t.decimal "gross_return"
  end

  create_table "landing_pages", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "text1"
    t.text "text2"
    t.string "slug"
    t.integer "page_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string "postback_url"
    t.text "html"
    t.string "affiliate_link"
    t.text "style"
    t.boolean "show_landing"
    t.integer "order"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["deleted_at"], name: "index_landing_pages_on_deleted_at"
  end

  create_table "loans", id: :serial, force: :cascade do |t|
    t.integer "bank_id"
    t.string "name"
    t.text "description"
    t.string "link"
    t.string "slug"
    t.integer "loan_type"
    t.decimal "min_amount", precision: 20, scale: 4
    t.decimal "max_amount", precision: 20, scale: 4
    t.decimal "min_payment", precision: 20, scale: 4
    t.decimal "max_payment", precision: 20, scale: 4
    t.decimal "interest_rate", precision: 20, scale: 4
    t.decimal "start_rate", precision: 20, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "deleted_at"
    t.integer "order"
    t.boolean "active", default: true
    t.string "interest_rate_description"
    t.string "wizard_1"
    t.string "wizard_2"
    t.string "wizard_3"
    t.string "wizard_link"
    t.integer "max_daily_redirect"
    t.boolean "highlighted", default: false
    t.index ["bank_id"], name: "index_loans_on_bank_id"
    t.index ["deleted_at"], name: "index_loans_on_deleted_at"
  end

  create_table "manufacturers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta_tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.string "page"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "property"
    t.string "raw_text"
  end

  create_table "operators", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "postback_url"
  end

  create_table "product_redirects", force: :cascade do |t|
    t.integer "product_id"
    t.string "product_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_tips", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "active", default: true
    t.integer "product"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "text"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_wizards", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "wizard_id"
    t.index ["tag_id"], name: "index_tags_wizards_on_tag_id"
    t.index ["wizard_id"], name: "index_tags_wizards_on_wizard_id"
  end

  create_table "ufs", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "deleted_at"
    t.integer "choose_product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_wizard_answers", force: :cascade do |t|
    t.string "value"
    t.bigint "user_wizard_id"
    t.bigint "wizard_field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_wizard_id"], name: "index_user_wizard_answers_on_user_wizard_id"
    t.index ["wizard_field_id"], name: "index_user_wizard_answers_on_wizard_field_id"
  end

  create_table "user_wizards", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "wizard_id"
    t.text "answers", default: "{}"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "params"
    t.bigint "admin_user_id"
    t.index ["admin_user_id"], name: "index_user_wizards_on_admin_user_id"
    t.index ["user_id"], name: "index_user_wizards_on_user_id"
    t.index ["wizard_id"], name: "index_user_wizards_on_wizard_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "cpf"
    t.string "name"
    t.datetime "birthdate"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wizard_fields", id: :serial, force: :cascade do |t|
    t.integer "wizard_id"
    t.string "name"
    t.string "label"
    t.string "mask"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "search_type"
    t.boolean "allow_nil"
    t.string "default_value"
    t.integer "field_type"
    t.integer "step"
    t.string "dropdown_options"
    t.integer "min_value", default: 0
    t.integer "max_value", default: 10000
    t.integer "interval", default: 1000
    t.boolean "add_to_metrics", default: false
    t.index ["wizard_id"], name: "index_wizard_fields_on_wizard_id"
  end

  create_table "wizards", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "deleted_at"
    t.integer "wizard_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "redirect_to_first_result", default: false
    t.boolean "display_thank_you_page", default: false
    t.string "postback_url"
    t.string "pixel_code"
    t.string "thank_you_message", default: "Obrigado! Entraremos em contato logo mais!"
    t.boolean "show_to_broker", default: false
    t.text "welcome_message"
    t.boolean "wpp_button"
  end

  add_foreign_key "admin_users", "admin_profiles"
  add_foreign_key "admin_users_tags", "admin_users"
  add_foreign_key "admin_users_tags", "tags"
  add_foreign_key "banks_user_wizards", "banks"
  add_foreign_key "banks_user_wizards", "user_wizards"
  add_foreign_key "cell_phone_plans", "operators"
  add_foreign_key "consortia", "insurers"
  add_foreign_key "insurance_cars", "insurers"
  add_foreign_key "insurance_travels", "insurers"
  add_foreign_key "insurances", "insurers"
  add_foreign_key "loans", "banks"
  add_foreign_key "tags_wizards", "tags"
  add_foreign_key "tags_wizards", "wizards"
  add_foreign_key "user_wizard_answers", "user_wizards"
  add_foreign_key "user_wizard_answers", "wizard_fields"
  add_foreign_key "user_wizards", "admin_users"
  add_foreign_key "user_wizards", "users"
  add_foreign_key "user_wizards", "wizards"
  add_foreign_key "wizard_fields", "wizards"
end
