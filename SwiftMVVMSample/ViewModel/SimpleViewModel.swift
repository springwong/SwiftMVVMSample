//
//  SimpleViewModel.swift
//  SwiftMVVMSample
//
//  Created by Spring Wong on 10/3/2018.
//  Copyright © 2018 Spring Wong. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class SimpleViewModel {
     lazy fileprivate var githubService : MoyaProvider<GithubService> = (UIApplication.shared.delegate as! AppDelegate).getContainer().resolve(MoyaProvider<GithubService>.self)!
    
    
    func getMyProfile() -> Single<Response>{
        return githubService.rx.request(.myProfile)
    }
}
