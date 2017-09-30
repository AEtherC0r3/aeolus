json.extract! data_point, :id, :type, :value, :room_id, :node_id, :created_at, :updated_at
json.url data_point_url(data_point, format: :json)
