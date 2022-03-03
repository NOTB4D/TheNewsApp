//
//  Contracts.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation

protocol ProviderProtocol {
    func request<T: Decodable>(model: T.Type,
                               parameters:[String: String],
                                       completion: @escaping (NetworkResponse<T>)-> Void  )
}
