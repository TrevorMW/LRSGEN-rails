class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report

      t.timestamps
    end
  end
end
