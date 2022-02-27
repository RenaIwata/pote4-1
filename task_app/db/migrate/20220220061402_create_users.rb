class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :ttl
      t.datetime :start
      t.datetime :end
      t.string :all
      t.text :memo
      t.timestamps
    end
  end
end
