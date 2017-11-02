//
//  ClassificationEventsJSONLoader.swift
//  Field Survey
//
//  Created by Aidan Madden on 11/1/17.
//  Copyright © 2017 Aidan Madden. All rights reserved.
//

import Foundation

class ClassificationEventsJSONLoader {
    
    class func load(fileName: String) -> [ClassificationEvent]{
        var events = [ClassificationEvent]()
        
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
            events = ClassificationEventsJSONParser.parse(data)
        }
        return events
    }
    
}
