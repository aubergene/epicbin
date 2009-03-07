class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|

      t.timestamps
      t.column :dow,      :integer
      t.column :name,     :string
      t.column :user_id,  :integer
    end
  end

  def self.down
    drop_table :collections
  end
end
