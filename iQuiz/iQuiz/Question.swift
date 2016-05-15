//
//  Question.swift
//  iQuiz
//
//  Created by chelseaGJW on 16/5/13.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import Foundation
class Question {
    init(questionText: String, correctAnswer: Int, answers: [String]){
        self.questionText = questionText
        self.correctAnswer = correctAnswer
        self.answers = answers
    }
    
    
    
    var questionText: String = ""
    //var answer1: String = ""
    //var answer2: String = ""
    //var answer3: String = ""
    //var answer4: String = ""
    var correctAnswer: Int = -1
    var answers = [String]()
    
}