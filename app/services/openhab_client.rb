class OpenhabClient
    include HTTParty
    base_uri 'http://localhost:8080' # openHABのベースURLを設定
  
    def fetch_items
      response = self.class.get('/items', headers: { 'Accept' => 'application/json' })
  
      if response.success?
        JSON.parse(response.body)
      else
        nil
      end
    end
  end