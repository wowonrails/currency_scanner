class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.references :currency, foreign_key: true
      t.date       :date_at
      t.float      :value
      t.datetime   :expires_at
      t.boolean    :forced, default: false

      t.timestamps
    end

    add_index :rates, :expires_at
  end
end
