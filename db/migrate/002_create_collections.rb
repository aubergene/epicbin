class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|

      t.timestamps
      t.column :time, :datetime
      t.column :type, :string
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :collections
  end
end
