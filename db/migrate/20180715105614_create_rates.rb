class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer  :currency_id
      t.date     :date_at
      t.float    :value
      t.datetime :expires_at
      t.boolean  :forced, default: false

      t.timestamps
    end

    add_index :rates, :currency_id, unique: true
    add_index :rates, :expires_at
  end
end
