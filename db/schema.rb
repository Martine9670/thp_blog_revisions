ActiveRecord::Schema[8.1].define(version: 2026_02_26_100951) do
  create_table "articles", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "title"
    t.datetime "updated_at", null: false
  end
end
