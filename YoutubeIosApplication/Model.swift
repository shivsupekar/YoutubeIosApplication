//
//  Model.swift
//  YoutubeIosApplication
//
//  Created by Shivam on 09/08/24.
//

import Foundation

protocol ModelDelegate{
    func videoFetched(_ videos:[Video])
}
class Model{
    
    var deligate:ModelDelegate?
    
    
    func getVedios(){
        //create an url object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        //get urlsession object
        
        let session = URLSession.shared
        //get a datatask for the urlsession object
        
        let dataTask = session.dataTask(with: url!) {  data, response, error in
          
            if error != nil || data == nil {
                return
            }
            
            do{
                //parsing the data into vedio object
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let response =  try decoder.decode(Response.self, from: data!)
               
                if response.items != nil{
                    DispatchQueue.main.async{
                        self.deligate?.videoFetched( response.items!)
                    }
                    
                }
                dump(response)
            }
            catch{
                
            }
            
        }
        
        //kick off the task
        dataTask.resume()
        
    }
}
