
require 'roo'

class ExcelToJsonController < ApplicationController
  def convert
    # エクセルファイルのパス
    excel_file_path = Rails.root.join('public', 'a.xlsx')

    # エクセルファイルを読み込む
    excel = Roo::Excelx.new(excel_file_path)

    # シート名
    sheet_name = excel.sheets.first

    # エクセルファイルのデータをJSONに変換
    data = {}
    excel.sheet(sheet_name).each_with_index do |row, index|
      next if index == 0  # ヘッダー行をスキップ

      id = row[0]
      name = row[1]
      label = row[2]
      plate = row[3]

      data["people#{index}"] = {
        "ID": id,
        "Name": name,
        "Label": label,
        "Plate": plate
      }
    end

    # JSONファイルにデータを書き込む
    json_file_path = Rails.root.join('public', 'jsonData.json')
    File.open(json_file_path, 'w') do |f|
      f.write(JSON.pretty_generate(data))
    end
    
    render json: { message: 'エクセルファイルがJSONファイルに変換されました' }
  end
end