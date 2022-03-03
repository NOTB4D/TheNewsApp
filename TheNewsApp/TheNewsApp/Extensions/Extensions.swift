//
//  Extensions.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation

public extension Encodable {
    var dictionary: [String:String] {
        guard let data = try? JSONEncoder().encode(self) else {return [:] }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap{$0 as? [String:String]} ?? [:]
    }
}
