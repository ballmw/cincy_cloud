class CreateTwitterStreams < ActiveRecord::Migration

  def self.up
    create_table :twitter_streams do |t|
      t.string :username
      t.integer :num_to_display
      t.integer :position

      t.timestamps
    end

    add_index :twitter_streams, :id

    load(Rails.root.join('db', 'seeds', 'twitter_streams.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "twitter_streams"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/twitter_streams"})
    end

    drop_table :twitter_streams
  end

end
