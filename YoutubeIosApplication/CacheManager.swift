//
//  CacheManager.swift
//  YoutubeIosApplication
//
//  Created by Shivam on 12/08/24.
//

import Foundation
class CacheManager{
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?){
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        
        return cache[url]
    }
}
