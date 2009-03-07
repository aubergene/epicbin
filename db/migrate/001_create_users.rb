class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.timestamps
      t.column :twitter_username, :string
      t.column :postcode, :string
    end
  end

  def self.down
    drop_table :users
  end
end
