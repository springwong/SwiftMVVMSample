//
//  MoyaExtension.swift
//  SwiftMVVMSample
//
//  Created by Spring Wong on 11/3/2018.
//  Copyright © 2018 Spring Wong. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    func toMappable<U : Mappable>() -> PrimitiveSequence<SingleTrait, U> {
        return self.mapString().map { (string) in
                return U(JSONString: string)!
        }
    }
}
