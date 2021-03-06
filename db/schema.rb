# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_16_143438) do

  create_table "org_companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar"
    t.text "description"
    t.string "verfication_doc"
    t.boolean "verified"
    t.integer "typ_company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["typ_company_id"], name: "index_org_companies_on_typ_company_id"
  end

  create_table "org_contacts", force: :cascade do |t|
    t.string "address1", null: false
    t.string "address2"
    t.string "city", null: false
    t.string "postal_code", null: false
    t.string "email", null: false
    t.string "business_number", null: false
    t.string "cell_number"
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "avatar"
    t.integer "typ_contact_id"
    t.integer "typ_country_id"
    t.integer "typ_region_id"
    t.integer "org_company_id"
    t.integer "org_person_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["org_company_id"], name: "index_org_contacts_on_org_company_id"
    t.index ["org_person_id"], name: "index_org_contacts_on_org_person_id"
    t.index ["typ_contact_id"], name: "index_org_contacts_on_typ_contact_id"
    t.index ["typ_country_id"], name: "index_org_contacts_on_typ_country_id"
    t.index ["typ_region_id"], name: "index_org_contacts_on_typ_region_id"
  end

  create_table "org_people", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "org_products", force: :cascade do |t|
    t.integer "org_company_id"
    t.integer "typ_category_id"
    t.integer "typ_subcategory_id"
    t.string "name", null: false
    t.text "description", null: false
    t.decimal "weight_in_grams", default: "0.0", null: false
    t.decimal "price", precision: 5, scale: 2, null: false
    t.integer "available_quantity", null: false
    t.datetime "expiry_date", null: false
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.boolean "online_order_available", null: false
    t.float "tax_amount", default: 0.0
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["org_company_id"], name: "index_org_products_on_org_company_id"
    t.index ["typ_category_id"], name: "index_org_products_on_typ_category_id"
    t.index ["typ_subcategory_id"], name: "index_org_products_on_typ_subcategory_id"
  end

  create_table "trx_order_fees", force: :cascade do |t|
    t.float "fee_amount", null: false
    t.integer "trx_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trx_order_id"], name: "index_trx_order_fees_on_trx_order_id"
  end

  create_table "trx_order_items", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.decimal "weight_in_grams", null: false
    t.decimal "price", precision: 20, scale: 4, null: false
    t.decimal "available_quantity", null: false
    t.integer "quantity", null: false
    t.datetime "expiry_date", null: false
    t.string "image", null: false
    t.integer "org_company_id"
    t.integer "org_product_id"
    t.integer "typ_category_id"
    t.integer "typ_subcategory_id"
    t.integer "trx_order_id"
    t.integer "shipping_address_id"
    t.decimal "net_amount", precision: 20, scale: 4
    t.decimal "tax_amount", precision: 20, scale: 4
    t.boolean "delivery_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["org_company_id"], name: "index_trx_order_items_on_org_company_id"
    t.index ["org_product_id"], name: "index_trx_order_items_on_org_product_id"
    t.index ["shipping_address_id"], name: "index_trx_order_items_on_shipping_address_id"
    t.index ["trx_order_id"], name: "index_trx_order_items_on_trx_order_id"
    t.index ["typ_category_id"], name: "index_trx_order_items_on_typ_category_id"
    t.index ["typ_subcategory_id"], name: "index_trx_order_items_on_typ_subcategory_id"
  end

  create_table "trx_orders", force: :cascade do |t|
    t.integer "org_company_id"
    t.integer "bill_to_contact_id"
    t.integer "ship_to_contact_id"
    t.integer "trx_order_fee_id"
    t.decimal "total_amount", precision: 20, scale: 4
    t.datetime "purchased_at"
    t.string "transport_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bill_to_contact_id"], name: "index_trx_orders_on_bill_to_contact_id"
    t.index ["org_company_id"], name: "index_trx_orders_on_org_company_id"
    t.index ["ship_to_contact_id"], name: "index_trx_orders_on_ship_to_contact_id"
    t.index ["trx_order_fee_id"], name: "index_trx_orders_on_trx_order_fee_id"
  end

  create_table "typ_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "typ_companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "typ_contacts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "typ_countries", force: :cascade do |t|
    t.string "iso"
    t.string "iso3"
    t.string "fips"
    t.string "country"
    t.string "continent"
    t.string "currency_code"
    t.string "currency_name"
    t.string "phone_prefix"
    t.string "postal_code"
    t.string "languages"
    t.string "geonameid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "typ_fees", force: :cascade do |t|
    t.string "name", null: false
    t.float "fee_percentage", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "typ_positions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "typ_regions", force: :cascade do |t|
    t.string "name"
    t.string "timezone"
    t.integer "typ_country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["typ_country_id"], name: "index_typ_regions_on_typ_country_id"
  end

  create_table "typ_sales_taxes", force: :cascade do |t|
    t.float "tax_rate", null: false
    t.integer "typ_region_id"
    t.integer "typ_tax_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["typ_region_id"], name: "index_typ_sales_taxes_on_typ_region_id"
    t.index ["typ_tax_id"], name: "index_typ_sales_taxes_on_typ_tax_id"
  end

  create_table "typ_subcategories", force: :cascade do |t|
    t.string "name"
    t.integer "typ_category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["typ_category_id"], name: "index_typ_subcategories_on_typ_category_id"
  end

  create_table "typ_taxes", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
