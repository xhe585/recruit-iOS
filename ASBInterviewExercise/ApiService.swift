//
//  ApiService.swift
//  ASBInterviewExercise
//
//  Created by Jackie He on 10/07/22.
//

import Foundation
import UIKit

public class ApiService
{
    static let shared = ApiService()
    
    func getTransactions(completionHandler: @escaping ([Transaction])-> Void, errorHandler: @escaping (Error) -> Void)
    {
        let restClient = DIManager.shared.resolve(RestClient.self)
        let uri = "https://gist.githubusercontent.com/Josh-Ng/500f2716604dc1e8e2a3c6d31ad01830/raw/4d73acaa7caa1167676445c922835554c5572e82/test-data.json"

        guard let url = URL(string: uri) else {
            //handle
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        //TODO need wrap this
        restClient?.apiRequest(request, completionHandler: { data, response, error in
            if error != nil{
                //TODO handle error
            } else {
                //check status code?
                if(data != nil)
                {
                    let transactions = JsonManager.shared.decode([Transaction].self, data!)
                    completionHandler(transactions ?? [Transaction]())
                }
                else
                {
                    //handle
                }
            }
        })
    }
}
