class CreateQforms < ActiveRecord::Migration
  def self.up
    create_table :qforms do |t|
      t.string :account
      t.string :opportunity
      t.string :platforms
      t.string :environments
      t.string :hosts
      t.string :technologies
      t.string :othertechnology
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :qforms
  end
end
