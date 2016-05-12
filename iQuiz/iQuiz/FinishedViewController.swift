//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by chelseaGJW on 16/5/11.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    
    var correctNum = 0
    var totalNum = 0

    @IBOutlet var finalScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScore.text = "FinalResult: \(correctNum) / \(totalNum) "

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToMain() {
        self.navigationController!.popToRootViewControllerAnimated(true)
        
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
