class AddFieldsToApiLog < ActiveRecord::Migration
  def change
    add_column :api_logs, :application_id, :integer
    add_column :api_logs, :log_type, :string
    add_column :api_logs, :method, :string
    add_column :api_logs, :version, :string
    add_column :api_logs, :request_url, :string
    add_column :api_logs, :object, :string
    add_column :api_logs, :payload, :string
    add_column :api_logs, :status, :integer
    add_column :api_logs, :duration, :float
    add_column :api_logs, :records_returned, :integer
  end
end