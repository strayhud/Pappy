class CreateSlides < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.integer :presentation_id
      t.integer :image_id
      t.string  :image_file_name
      t.string  :image_content_type
      t.string  :image_file_size
      t.string  :image_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :slides
  end
end
