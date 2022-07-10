//
//  JsonDecoder.swift
//  ASBInterviewExercise
//
//  Created by Jackie He on 10/07/22.
//

import Foundation

public class JsonManager
{
    static let shared = JsonManager()
    let decoder = JSONDecoder()
    
    func decode<T: Decodable>(_ type: T.Type, _ data: Data) -> T?{
        var obj:T? = nil
        do{
            obj =  try decoder.decode(type, from: data)
        } catch {
            //TODO handle error in a central place
            print(error)
        }
        return obj
    }
}
