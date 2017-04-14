class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :quotation_text, null: false

      t.timestamps null: false
    end
  end
end


