//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by chelseaGJW on 16/5/11.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import UIKit

struct Question {
    var question: String
    var choices: [String]!
    var answer: Int
    
}




class QuestionViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!

    @IBOutlet var questionLabel: UILabel!
    var text: String = ""
 
    
    var questions = [Question]()
    var qNum = Int()
    var answerNum = Int()
    var indicator =  ""
    var answer = ""
    var noMoreQuestion = false
    var TheFirstQuestion = true
    var correctNum = Int()
    var wrongNum = Int()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        questionLabel.text = text
        if(TheFirstQuestion){
            TheFirstQuestion = false
        switch text {
        case "MathQ":
            questions = [Question(question:"1+1 = ?", choices: ["A. 1", "B. 2", "C. 3", "D. 4"], answer: 1 ), Question(question:"1+2 = ?", choices: ["A. 1", "B. 2", "C. 3", "D. 4"], answer: 2 ), Question(question:"1+3 = ?", choices: ["A. 1", "B. 2", "C. 3", "D. 4"], answer: 3 )]
        case "MarvelQ":
            questions = [Question(question:"What was the name of the comic series that Thor first appeared in ?", choices: ["A. Journey into Adventure", "B. Journey into Danger", "C. Journey into Asgard", "D. Journey into Mystery"], answer: 3 )]
        case "ScienceQ":
            questions = [Question(question:"Which planet is closest to the sun?", choices: ["A. Mercury", "B. Venus", "C. Earth", "D. Neptune"], answer: 0)]
        default:
            break
        }
        }
        questionLabel.sizeToFit()
        
        pickQuestion()
        
        
        // Do any additional setup after loading the view.
    }
  
    // set questions with categories
    func pickQuestion() {
        if questions.count > 0 {
            qNum = 0
            questionLabel.text = questions[qNum].question
            for i in 0..<buttons.count{
                buttons[i].setTitle(questions[qNum].choices[i], forState: UIControlState.Normal)
            }
            answerNum = questions[qNum].answer
            answer = buttons[answerNum].currentTitle!
            
            questions.removeAtIndex(qNum)
        }
                
    }
    
       
    
    //which button pressed
    
    @IBAction func But1(sender: AnyObject) {
        if answerNum == 0 {
            indicator = "You got right!"
        }else{
            indicator = "You got wrong!"
        }
    }
    
    
    @IBAction func But2(sender: AnyObject) {
        if answerNum == 1 {
            indicator = "You got right!"
        }else{
            indicator = "You got wrong!"
        }

    }
    
    
    @IBAction func But3(sender: AnyObject) {
        if answerNum == 2 {
            indicator = "You got right!"
        }else{
            indicator = "You got wrong!"
        }

    }
    
    
    @IBAction func But4(sender: AnyObject) {
        if answerNum == 3 {
            indicator = "You got right!"
        }else{
            indicator = "You got wrong!"
        }

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAnswer" {
            let answerVC  = segue.destinationViewController as! AnswerViewController
            //need to pass correct answer text the right button
            //need to pass indicator label text
            answerVC.questionText = questionLabel.text!
            answerVC.indicatorText = indicator
            answerVC.answerText = answer
            answerVC.datafromQ = noMoreQuestion
            answerVC.questionsBook = questions
            answerVC.correctNum = correctNum
            answerVC.wrongNUM = wrongNum
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
