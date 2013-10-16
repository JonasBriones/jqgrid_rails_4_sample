class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :contact
      t.datetime :date_of_join

      t.timestamps
    end
  end
end
