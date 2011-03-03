class CreateQforms < ActiveRecord::Migration
  def self.up
    create_table :qforms do |t|
      t.string :customer
      t.string :platform
      t.string :technologies
      t.string :size
      t.string :audience
      t.string :purpose
      t.string :recording
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :qforms
  end
end
