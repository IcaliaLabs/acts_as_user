ActiveRecord::Schema.define(:version => 0) do
  create_table :users do |t|
    t.string :email
    t.string :userable_type
    t.integer :userable_id
  end
  add_index :users, [:userable_id, :userable_type]

  create_table :customers do |t|
    t.string :name
    t.string :city
  end

  create_table :admins do |t|
  end

  create_table :partners do |t|
    t.string :name
  end
end
