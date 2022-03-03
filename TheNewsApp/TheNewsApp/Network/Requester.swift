//
//  Requester.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation
import UIKit
import Alamofire

enum NetworkResponse<T> {
    case success(T)
    case fail(Error)
}


class Requester: ProviderProtocol {
    
    private lazy var baseUrl = "https://newsapi.org/v2/top-headlines?"
    
    func request<T: Decodable>(model: T.Type,
                               parameters: [String: String] = [:],
                               completion: @escaping (NetworkResponse<T>) -> Void) {
        var queryParams = parameters
        queryParams["apiKey"] = "93b6e88ee27d4a9e8d5947008eab41db"
        let urlString = prepareUrl(params: queryParams)
        AF.request(urlString, method: .get).responseData { data in
            switch data.result {
            case let .success(responseData):
                do {
                    let model = try JSONDecoder().decode(T.self, from: responseData)
                    completion(.success(model))
                } catch let error as NSError {
                    completion(.fail(error))
                }
            case .failure (let error):
                completion(.fail(error))
            }
        }
    }
    private func prepareUrl(params: [String:String]) -> String {
        var resultUrl = baseUrl
        params.forEach {
            resultUrl += "\($0.key)=\($0.value)& "
        }
        resultUrl.removeLast()
        return resultUrl
    }
    
    
}
