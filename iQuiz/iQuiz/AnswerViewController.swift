//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by chelseaGJW on 16/5/11.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import UIKit




class AnswerViewController: UIViewController {
    //puss question data
    @IBOutlet var s: UILabel!
    var questionText = ""
    
    //pass correct answer
    @IBOutlet var rightAnswer: UIButton!
    var  answerText = ""
    
    //pass indicator
    @IBOutlet var indicatorLabel: UILabel!
    var indicatorText = ""
    
    //pass the how many question left boolean
   var NomoreQuesitons = true
    var datafromQ = true
    
    var correctNum = 0
    var wrongNUM = 0
    var theFirstQuestion = false
    var questionsBook = [Question]()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        s.text = questionText
        indicatorLabel.text = indicatorText
        rightAnswer.setTitle(answerText, forState: .Normal)
        if indicatorText == "You got right!" {
        rightAnswer.setTitleColor(UIColor.greenColor(), forState: .Normal)
            correctNum = correctNum + 1
        }
        else{
            rightAnswer.setTitleColor(UIColor.redColor(), forState: .Normal)
            wrongNUM = wrongNUM + 1
        }
    }
    
    //back to main page
    @IBAction func backToMain() {
        self.navigationController!.popToRootViewControllerAnimated(true)

    }
    
  

    //goes to finish page
   @IBAction func NextQuestion(sender: AnyObject) {
        if questionsBook.count == 0 {
                performSegueWithIdentifier("goToFinish", sender: self)
        }else{
          performSegueWithIdentifier("backToQuestion", sender: self)

    }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToFinish" {
            let finishVC  = segue.destinationViewController as! FinishedViewController
            //need to pass correct answer + totalQuestions
            finishVC.correctNum  = correctNum
            finishVC.totalNum = correctNum + wrongNUM
        }
        if segue.identifier == "backToQuestion" {
            let questionVC = segue.destinationViewController as! QuestionViewController
            questionVC.TheFirstQuestion = theFirstQuestion
            questionVC.questions = questionsBook
            questionVC.correctNum = correctNum
            questionVC.wrongNum = wrongNUM
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
