//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by chelseaGJW on 16/5/11.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import UIKit


class QuestionViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!

    @IBOutlet var questionLabel: UILabel!
    var text: String = ""
 
    
    var questions = [Question]()
    var category = ""
    
    var qDic = [String: [Question]]()
    var testQuestions = [Question]()

    
    var qNum = Int()
    var answerNum = Int()
    var indicator =  ""
    var answer = ""
    var noMoreQuestion = false
    var TheFirstQuestion = true
    var correctNum = Int()
    var wrongNum = Int()
    
    
    // set questions with categories
    func pickQuestion() {
        if questions.count > 0 {
            qNum = 0
            questionLabel.text = questions[qNum].questionText
            
            for i in 0..<buttons.count{
                buttons[i].setTitle(questions[qNum].answers[i], forState: UIControlState.Normal)
            }
            answer = buttons[answerNum].currentTitle!
            
            questions.removeAtIndex(qNum)
        }
    }

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        questionLabel.text = category
        
        if(TheFirstQuestion){
        TheFirstQuestion = false
        questions = qDic[category]!
            for  q in questions {
            questionLabel.text = q.questionText
            answerNum = q.correctAnswer - 1
               
                for i in 0..<buttons.count{
                    buttons[i].setTitle(q.answers[i], forState: UIControlState.Normal)
                }
            }
           
        }
        questionLabel.sizeToFit()
        pickQuestion()

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
