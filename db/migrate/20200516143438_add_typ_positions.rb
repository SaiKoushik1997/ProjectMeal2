class AddTypPositions < ActiveRecord::Migration[6.0]
  def up
  	TypPosition.create(name: "Chief of operations");
  	TypPosition.create(name: "Director");
  	TypPosition.create(name: "Regional Manager");
  	TypPosition.create(name: "Store Manager");
  	TypPosition.create(name: "Employee");
  end
  def down
  end
end
