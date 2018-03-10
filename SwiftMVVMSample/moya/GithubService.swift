//
//  GithubService.swift
//  SwiftMVVMSample
//
//  Created by Spring Wong on 11/3/2018.
//  Copyright © 2018 Spring Wong. All rights reserved.
//

import Foundation
import Moya

enum GithubService {
    case myProfile
}

extension GithubService : TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .myProfile:
            return "/users/springwong"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .myProfile:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .myProfile:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .myProfile:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
