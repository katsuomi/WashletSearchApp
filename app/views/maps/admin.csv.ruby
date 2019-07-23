require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(名称 緯度 経度)
  csv << csv_column_names
  @maps.each do |map|
    csv_column_values = [
      map.address,
      map.latitude,
      map.longitude
    ]
    csv << csv_column_values
  end
end