//
//  ViewController.swift
//  iQuiz
//
//  Created by chelseaGJW on 16/5/3.
//  Copyright © 2016年 chelseaGJW. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var names = ["Mathmatics", "Marvel Super Heroes", "Science"]
    var descriptions = ["Generate a set of math probelms", "Can you name the Marvel super heroes based on description of their power? ", "Test your knowledge of science facts"]
    var images = [UIImage(named: "Mathmatics"),UIImage(named: "Marvel"),UIImage(named: "Science")]
    var questions = ["MathQ", "MarvelQ", "ScienceQ"]
    
    //Setting Alert
    @IBAction func showAlert(sender: AnyObject) {
        let alertController = UIAlertController(title: "Alert", message: "Settings go here", preferredStyle: .Alert)
        
        var cancel = UIAlertAction(title:"Cancel", style: UIAlertActionStyle.Cancel){
            UIAlertAction in
            self.tableView
        }
        
        alertController.addAction(cancel)
        self.presentViewController(alertController, animated: true, completion: nil)
        
        }
   
   //Let the cell size auto fit the texts
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //self.tableView.registerClass(CutomizeCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // create the main page using UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return names.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CutomizeCell
        cell.photo.image = images[indexPath.row]
        cell.quizDescr.text = descriptions[indexPath.row]
        cell.name.text = names[indexPath.row]
        return cell
    }
    
   // pass data to detailed view

   /*
    func questionAtIndexPath(indexPath: NSIndexPath)-> String {
        return questions[indexPath.row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showQuestion":
                let questiondetailedVC = segue.destinationViewController as! QuestionViewController
                if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                    questiondetailedVC.text = questionAtIndexPath(indexPath)
                }
            default:
                break
            }
        
    }
    }
 */
    
   
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showQuestion" {
            let questionVC  = segue.destinationViewController as! QuestionViewController
            let myindexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
            let rowSelected = myindexPath.row
            questionVC.text = questions[rowSelected]
        }
    }
}




