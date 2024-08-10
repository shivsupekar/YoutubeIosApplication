//
//  Model.swift
//  YoutubeIosApplication
//
//  Created by Shivam on 09/08/24.
//

import Foundation
class Model{
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
        }
        
        //kick off the task
        dataTask.resume()
        
    }
}
