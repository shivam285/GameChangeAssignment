//
//  API.swift
//  GameChangeAssignment
//
//  Created by shivam.seth on 11/08/19.
//  Copyright © 2019 shivam.seth. All rights reserved.
//

import Foundation

protocol APIFetcher {
    static func fetch<R: APIRequest>(request: R, completionHandler: @escaping (_ response: APIResponse<R.APIResourceType>) -> ())
}

final class API : APIFetcher {
    
    static func fetch<R>(request: R, completionHandler: @escaping (_ response: APIResponse<R.APIResourceType>) -> (Void)) where R : APIRequest {
     
        do {
            let request = try request.asURLRequest()
            print(request)
            var delegate: URLSessionDelegate?
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30
            
            let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
             
            let dataTask = session.dataTask(with: request) { (data, response, error) in

                if let error = error {
                    completionHandler(.error(.error(error)))
                    return
                }
                
                guard let data = data else {
                    completionHandler(.error(.noData))
                    return
                }
                
                let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]
                print(jsonObject)
                completionHandler(.resource(R.APIResourceType(jsonObject)))
            }
            
            dataTask.resume()
            
        }catch {
            print(error.localizedDescription)
        }
    }
    
}
