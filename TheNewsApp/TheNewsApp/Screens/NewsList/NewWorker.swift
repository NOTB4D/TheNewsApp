//
//  NewWorker.swift
//  TheNewsApp
//
//  Created by Eser Kucuker on 3.03.2022.
//

import Foundation

final class Networker: NewsWorkingLogic {
    
    func getNews(request: NewsList.Request, completion: @escaping ((Result<NewsList, Error>) -> Void)) {
        
        Requester().request(model: NewsList.self, parameters: request.dictionary)
        {
            result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .fail(let error):
                completion(.failure(error))
            }
        }
    }
}
