class CreateRelatedLinks < ActiveRecord::Migration

  def self.up
    create_table :related_links do |t|
      t.string :name
      t.string :href
      t.text :description
      t.boolean :open_in_new_window
      t.integer :position

      t.timestamps
    end

    add_index :related_links, :id

    load(Rails.root.join('db', 'seeds', 'related_links.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "related_links"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/related_links"})
    end

    drop_table :related_links
  end

end
