json.extract! report_error, :id, :errormessage, :user_id, :created_at, :updated_at
json.url report_error_url(report_error, format: :json)
