class CreateSpreeReimbursementTypes < ActiveRecord::Migration
  def change
    create_table :spree_reimbursement_types do |t|
      t.string :name
      t.boolean :active, default: true
      t.boolean :mutable, default: true

      t.timestamps
    end

    reversible do |direction|
      direction.up do
        Spree::ReimbursementType.create!(name: Spree::ReimbursementType::ORIGINAL)
      end
    end

    add_column :spree_return_items, :preferred_reimbursement_type_id, :integer
    add_column :spree_return_items, :override_reimbursement_type_id, :integer
  end
end
