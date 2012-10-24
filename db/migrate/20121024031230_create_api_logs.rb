class CreateApiLogs < ActiveRecord::Migration
  def change
    create_table :api_logs do |t|

      t.timestamps
    end
  end
end
