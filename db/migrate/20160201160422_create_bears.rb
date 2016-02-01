class CreateBears < ActiveRecord::Migration
  def change
    create_table :bears do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
