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
    
    var images = [UIImage(named: "Science"),UIImage(named: "Marvel"),UIImage(named: "Mathmatics")]
    var topicBook = [Topic]()
    var questionsDic = [String: [Question]]()
    
    var TopicNameArray = [String]()
    var TopicDescrArray = [String]()
    var url = "http://tednewardsandbox.site44.com/questions.json"
    

    
   //Let the cell size auto fit the texts
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension
        if isConnectedToNetwork(){
        httpGet(self.url)
        }else{
        retrieveOffline("/Users/chelseaGJW/Documents/code/iQuiz/iQuiz/question.json")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // create the main page using UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return TopicNameArray.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CutomizeCell
        cell.photo.image = images[indexPath.row]
        if(TopicNameArray.count != 0){
        cell.quizDescr.text = TopicDescrArray[indexPath.row]
        cell.name.text = TopicNameArray[indexPath.row]
        }else{
            cell.quizDescr.text = ""
            cell.name.text = ""
        }
        return cell
    }
    
    
    
    

    
// use segue tafser data between different view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showQuestion" {
            let questionVC  = segue.destinationViewController as! QuestionViewController
            let myindexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
            let rowSelected = myindexPath.row
            
            let topicTitle = TopicNameArray[rowSelected]
            questionVC.category = TopicNameArray[rowSelected]
            questionVC.qDic = questionsDic
            
        }
    }
 
    
    //online
    func httpGet(url: String) {
        let requestURL: NSURL = NSURL(string: self.url)!
        let urlRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {(data, response, error) -> Void in
            
            if (error == nil) {
                
                do{
                   // let rawData = data.dataUsingEncoding(NSUTF8StringEncoding);
                    let fileM = NSFileManager.defaultManager();
                    
                    //stored to local
                    fileM.createFileAtPath("/Users/chelseaGJW/Documents/code/iQuiz/iQuiz/question.json", contents: data, attributes: nil);
                    if let topicArray : NSArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray  {
                      

                        for topic in topicArray {
                            let title1 = topic["title"] as! String
                            let aa = topic["desc"] as! String
                            let questionArray = topic["questions"] as! NSArray
                            var questionsArray = [Question]()
                            for q in questionArray {
                                
                                    let text = q["text"] as! String
                                    let correctAnswer = q["answer"] as! String
                                    let answersArray = q["answers"] as! NSArray
                                    var AnswersArray = [String]()

                                for a in answersArray {
                                   AnswersArray.append(a as! String)
                                }
                                questionsArray.append(Question(questionText: text, correctAnswer: Int(correctAnswer)!, answers: AnswersArray ))
                                }
                            let newTopic = Topic(title: title1, description: aa,  questionList: questionsArray)
                            self.TopicNameArray.append(newTopic.title)
                            self.TopicDescrArray.append(newTopic.description)
                            self.questionsDic.updateValue(questionsArray, forKey: newTopic.title)
                            self.topicBook.append(newTopic)
                            }
                      
                    }
                  self.tableView.reloadData()
                    
                }catch {
                    print("Error with Json: \(error)")
                    
                }
                
            }
        }
        
        task.resume()
        
    }
    
    //offline
    private func retrieveOffline(getPath : String) {
        do {
            let data = try NSData(contentsOfFile: getPath, options: .DataReadingMappedIfSafe);
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            if let topicArray = (json as? NSArray){
                for topic in topicArray {
                    let title1 = topic["title"] as! String
                    let aa = topic["desc"] as! String
                    let questionArray = topic["questions"] as! NSArray
                    var questionsArray = [Question]()
                    for q in questionArray {
                        
                        let text = q["text"] as! String
                        let correctAnswer = q["answer"] as! String
                        let answersArray = q["answers"] as! NSArray
                        var AnswersArray = [String]()
                        
                        for a in answersArray {
                            AnswersArray.append(a as! String)
                        }
                        questionsArray.append(Question(questionText: text, correctAnswer: Int(correctAnswer)!, answers: AnswersArray ))
                    }
                    let newTopic = Topic(title: title1, description: aa,  questionList: questionsArray)
                    self.TopicNameArray.append(newTopic.title)
                    self.TopicDescrArray.append(newTopic.description)
                    self.questionsDic.updateValue(questionsArray, forKey: newTopic.title)
                    self.topicBook.append(newTopic)
                }
            }
        } catch {
            print(error)
            print("ERROR! didn't retrieve data offline")
        }
        
    }
    
    @IBAction func checkNow(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Settings", message: "Update JSON file", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addTextFieldWithConfigurationHandler({ (textField) -> Void in
         textField.placeholder = "url"})
        
        let checkNow = UIAlertAction(title: "Check Now", style: .Default){ (_) in
            let textfield = alertController.textFields![0] as? UITextField
              self.url = (textfield?.text)!
            }
        
        var cancel = UIAlertAction(title:"Cancel", style: UIAlertActionStyle.Cancel){
            UIAlertAction in
            self.tableView
        }
        
        alertController.addAction(cancel)
        alertController.addAction(checkNow)
        self.presentViewController(alertController, animated: true, completion: nil);
        
        
        
    }
    
    
    func isConnectedToNetwork()->Bool{
        
        var Status:Bool = false
        let url = NSURL(string: "http://google.com/")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "HEAD"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0
        
        var response: NSURLResponse?
        if let httpResponse = response as? NSHTTPURLResponse {
           Status = true
        }
        return Status
    }
    
}




