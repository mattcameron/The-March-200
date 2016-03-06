class RemovePartnersFromRuns < ActiveRecord::Migration
  def change
    remove_column :runs, :partners, :integer
  end
end
