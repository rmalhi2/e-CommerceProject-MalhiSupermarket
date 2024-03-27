class CreateContactPages < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_pages do |t|
      t.string :title
      t.string :phone
      t.string :email
      t.text :address

      t.timestamps
    end
  end
end
