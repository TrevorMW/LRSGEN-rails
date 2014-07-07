class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :report
      t.string :report_format
      t.string :report_type
      t.timestamps
    end
  end
end
