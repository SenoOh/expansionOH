module PeopleitemsHelper
    def load_people_data
        json_data = File.read('public/jsonData.json')
        JSON.parse(json_data)
    end
    # def load_json
    #     json_data = JSON.parse(File.read(Rails.root.join('public', 'jsonData.json')))
        
    #     json_data.each do |key, data|
    #         @id = data['ID']
    #         @name = data['Name']
    #         @label = data['Label']
    #         @plate = data['Plate'].to_s  # 整数を文字列に変換
    #     end
    # end
end
