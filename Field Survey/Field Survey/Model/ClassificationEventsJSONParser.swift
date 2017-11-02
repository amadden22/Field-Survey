//
//  ClassificationEventsJSONParser.swift
//  Field Survey
//
//  Created by Aidan Madden on 11/1/17.
//  Copyright © 2017 Aidan Madden. All rights reserved.
//

import Foundation

class ClassificationEventsJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [ClassificationEvent] {
        var classificationEvents = [ClassificationEvent] ()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            
                if let observations = root["observations"] as? [Any] {
                    for observation in observations {
                        if let observation = observation as? [String: String] {
                            if let classificationName = observation["classification"],
                            let title = observation["title"],
                            let description = observation["description"],
                            let dateString = observation["date"],
                            let date = dateFormatter.date(from: dateString){
                                
                                if let classificationEvent = ClassificationEvent(classificationName: classificationName, title: title, description: description, date: date){
                                    classificationEvents.append(classificationEvent)
                                }
                        }
                    }
                }
            }
            
        }
        
        
        
        return classificationEvents
    }

}
