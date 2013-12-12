class AddActsAsUserTo<%= table_name.camelize %> < ActiveRecord::Migration
  def self.up
    change_table(:<%= table_name %>) do |t|

      t.string :userable_type
      t.integer :userable_id

      <% attributes.each do |attribute| -%>
      t.<%= attribute.type %> :<%= attribute.name %>
      <% end -%>

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

    add_index :<%= table_name %>, [:userable_id, :userable_type]
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
