class CreatesActsAsUserTo<%= table_name.camelize %> < ActiveRecord::Migration
  def change
    create_table(:<%= table_name %>) do |t|
      t.string :userable_type
      t.integer :userable_id

      <% attributes.each do |attribute| -%>
        t.<%= attribute.type %> :<%= attribute.name %>
      <% end -%>

      t.timestamps
    end
    add_index :<%= table_name %>, [:userable_id, :userable_type]
  end
end
