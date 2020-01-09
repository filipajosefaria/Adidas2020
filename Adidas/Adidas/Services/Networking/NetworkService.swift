//
//  NetworkService.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import Alamofire

class NetworkService {
    
    static let shared = NetworkService()
 
    func getGoalsList(successBlock:@escaping (_ result: [Goal]) -> Void, errorBlock:@escaping (_ error: Error) -> Void) {
        
        AF.request(APIEndpoint.goals).responseDecodable(of: GoalsResponse.self) { (response) in
            
            switch response.result {
            case .failure(let error):
                errorBlock(error)
            case .success(let result):
                successBlock(result.items)
            }
        }
    }
}
