//
//  Topic.swift
//  iQuiz
//
//  Created by chelseaGJW on 16/5/13.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import Foundation
class Topic {
    init(title: String, description: String, questionList:[Question]) {
        self.title = title
        self.description = description
        self.questionList = questionList
        
    }
    var title: String = ""
    var description: String = ""
    var questionList:[Question] = [Question]()
}