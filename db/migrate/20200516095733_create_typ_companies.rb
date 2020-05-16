class CreateTypCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :typ_companies do |t|
t.string :name, null: false
      t.timestamps
    end
  end
end
