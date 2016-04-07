//
//  ViewController.swift
//  DoItApp
//
//  Created by Dali Lin on 16/3/24.
//  Copyright © 2016年 Dali Lin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var context:NSManagedObjectContext!
    var dataArr:Array<AnyObject> = []


    
    override func viewDidLoad() {
        super.viewDidLoad()

        context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBOutlet weak var doitFirst: UITextField!
    @IBOutlet weak var doitSecond: UITextField!
    @IBOutlet weak var doitThird: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    
    //var countValue = 0
    
    @IBAction func clearFirstBtnPressed(sender: AnyObject) {
        if doitFirst.text != "" {
            doitFirst.text = ""
            if countValue > 0 {countValue -= 1}
        }
    }
    @IBAction func clearSecondBtnPressed(sender: AnyObject) {
        if doitSecond.text != "" {
            doitSecond.text = ""
            if countValue > 0 {countValue -= 1}
        }
    }
    
    @IBAction func clearThirdBtnPressed(sender: AnyObject) {
        if doitThird.text != "" {
            doitThird.text = ""
            if countValue > 0 {countValue -= 1}
        }
    }
    
    @IBAction func clearAllBtnPressed(sender: AnyObject) {
        doitFirst.text = ""
        doitSecond.text = ""
        doitThird.text = ""
        countValue = 0
        
    }
 
    //数
    @IBAction func countIt(sender: AnyObject) {
        countValue = 0
        if doitFirst.text != "" {countValue += 1}
        if doitSecond.text != "" {countValue += 1}
        if doitThird.text != "" {countValue += 1}
    }
    
    @IBAction func GetDetail(sender: UIButton) {
     
        let f = NSFetchRequest(entityName:"Things")
        do{
            dataArr = try context.executeFetchRequest(f)
        }catch{}
        let one = dataArr[dataArr.count-1].valueForKey("detail")
        let two = dataArr[dataArr.count-1].valueForKey("detail2")
        let three = dataArr[dataArr.count-1].valueForKey("detail3")
      

        
        doitFirst.text = "\(one!)"
        doitSecond.text = "\(two!)"
        doitThird.text = "\(three!)"
        
        countValue = 0
        if doitFirst.text != "" {countValue += 1}
        if doitSecond.text != "" {countValue += 1}
        if doitThird.text != "" {countValue += 1}
        
    }
    
    @IBAction func SetDetail(sender: UIButton) {
        let row:AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Things", inManagedObjectContext: context)
        row.setValue(doitFirst.text, forKey: "detail")
        row.setValue(doitSecond.text, forKey: "detail2")
        row.setValue(doitThird.text, forKey: "detail3")
        do{
            try context.save()
        }catch{
        }
    }

    
    var countValue: Int32 {
        get {
            return NSNumberFormatter().numberFromString(countLabel.text!)!.intValue
        }
        set {
            countLabel.text = "\(newValue)"
        }
}

}

