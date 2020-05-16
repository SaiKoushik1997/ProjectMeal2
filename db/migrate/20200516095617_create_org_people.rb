class CreateOrgPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :org_people do |t|

      t.timestamps
    end
  end
end
