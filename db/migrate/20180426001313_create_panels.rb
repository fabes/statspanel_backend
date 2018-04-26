class CreatePanels < ActiveRecord::Migration[5.1]
  def change
    create_table :panels do |t|
      t.references :project, foreign_key: true
      t.string    :name
      t.integer   :tracking_frequency, default: 0
      t.integer   :target_goal, default: 0
      t.integer   :current_goal, default: 0
      t.integer   :potential_goal, default: 0
      t.string    :goal_unit_label, default: 0
      t.boolean   :is_currency, default: false
      t.integer   :status, default: 0      

      t.timestamps
    end
  end
end
