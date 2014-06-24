class Report < ActiveRecord::Migration
  def change
    add_column :reports, :report_type, :string
    add_column :reports, :report_format, :string

  end
end
