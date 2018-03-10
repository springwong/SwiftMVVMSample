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
    
    private var user : User? = nil
    func getMyProfile() -> Single<User>{
        if let user = user {
            return Single.just(user)
        }else {
            return githubService.rx.request(.myProfile).toMappable().do(onSuccess: { (user) in
                self.user = user
            })
        }
        
    }
}
