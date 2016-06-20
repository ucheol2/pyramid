class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :grade
      t.string :university
      t.string :gender

      t.datetime :birthday

      t.integer :age

      t.boolean :married

      t.timestamps null: false
    end
  end
end
