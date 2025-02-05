//
//  Response.swift
//  YoutubeIosApplication
//
//  Created by Shivam on 11/08/24.
//

import Foundation
struct Response : Decodable{
    var items:[Video]?
   
    
    enum CodingKeys: CodingKey {
        case items
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent([Video].self, forKey: .items)
    }
}
