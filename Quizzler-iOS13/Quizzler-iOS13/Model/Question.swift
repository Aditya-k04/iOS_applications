//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Aditya Khadke on 25/10/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let c: String
    
    
    
    init(q:String , a:[String] , correctAnswer:String) {
        text = q
        answer = a
        c = correctAnswer
        
    }
}
