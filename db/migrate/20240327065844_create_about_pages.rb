class CreateAboutPages < ActiveRecord::Migration[7.1]
  def change
    create_table :about_pages do |t|
      t.string :title
      t.text :paragraph1
      t.text :paragraph2
      t.text :paragraph3
      t.text :paragraph4
      t.text :paragraph5

      t.timestamps
    end
  end
end
