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
            decoder.dateDecodingStrategy = .custom({ decoder in
                let dateStr = try decoder.singleValueContainer().decode(String.self)
                let formatter = DateFormatter()
                formatter.calendar = Calendar(identifier: .iso8601)
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                guard let date = formatter.date(from: dateStr) else {
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Cannot decode date string \(dateStr)"))
                }
                return date
            })
            obj = try decoder.decode(type, from: data)
        } catch {
            //TODO handle error in a central place
            print(error)
        }
        return obj
    }
}
