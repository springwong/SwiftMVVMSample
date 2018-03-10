//
//  User.swift
//  SwiftMVVMSample
//
//  Created by Spring Wong on 11/3/2018.
//  Copyright © 2018 Spring Wong. All rights reserved.
//

import Foundation
import ObjectMapper

class User : Mappable {
    var login : String?
    var updated_at : String?
    
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        login                <- map["login"]
        updated_at           <- map["updated_at"]
    }
}
