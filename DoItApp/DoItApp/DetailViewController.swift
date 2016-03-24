//
//  DetailViewController.swift
//  DoItApp
//
//  Created by Dali Lin on 16/3/20.
//  Copyright © 2016年 Dali Lin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTitle: UITextField!
    @IBOutlet weak var detailContent: UITextView!
    var content:AnyObject?
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let title = self.detailTitle {
                title.text = detail.description
            }
        }
    }
    
    func editDetail(sender: AnyObject) {
        detailTitle.enabled = true
        detailContent.editable = true
        detailContent.selectable = true
        detailContent.selectAll(detailContent)
        let saveButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(DetailViewController.saveDetail(_:)))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    func saveDetail(sender: AnyObject) {
        detailTitle.enabled = false
        detailContent.editable = false
        detailContent.selectable = false
        detailContent.selectAll(detailContent)
        let editButton = UIBarButtonItem(barButtonSystemItem: .Edit , target: self, action: #selector(DetailViewController.editDetail(_:)))
        self.navigationItem.rightBarButtonItem = editButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let editButton = UIBarButtonItem(barButtonSystemItem: .Edit , target: self, action: #selector(DetailViewController.editDetail(_:)))
        self.navigationItem.rightBarButtonItem = editButton
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

