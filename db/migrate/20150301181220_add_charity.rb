class AddCharity < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :url
      t.datetime :start_on
      t.datetime :end_on
      t.timestamps
    end
  end
end
