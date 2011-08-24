class CreateBuzzs < ActiveRecord::Migration

  def self.up
    create_table :buzzs do |t|
      t.string :search
      t.integer :number_to_display
      t.integer :position

      t.timestamps
    end

    add_index :buzzs, :id

    load(Rails.root.join('db', 'seeds', 'buzzs.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "buzzs"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/buzzs"})
    end

    drop_table :buzzs
  end

end
