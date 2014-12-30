//
//  ViewController.swift
//  SinglePageWebBrowser
//
//  Created by Arjun Brar on 30/12/14.
//  Copyright (c) 2014 Arjun Brar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var URL_Bar: UIView!
    @IBOutlet var TextField: UITextField!
    @IBOutlet var WebBrowser: UIWebView!
    var address: String!
    
    let swipe = UISwipeGestureRecognizer()
    
    func load() {
        address = TextField.text!
        if address.rangeOfString("http://") != nil {
            let URL = NSURL (string: address)
            let URLReq = NSURLRequest (URL: URL!)
            WebBrowser.loadRequest(URLReq)
        } else {
            address = "http://" + address
            let URL = NSURL (string: address)
            let URLReq = NSURLRequest (URL: URL!)
            WebBrowser.loadRequest(URLReq)
        }
        TextField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        load()
        
        swipe.addTarget(self, action: "swipeControl")
        view.userInteractionEnabled = true
        view.addGestureRecognizer(swipe)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Go(theButton: UIButton) {
        
        load()
    }
    
    @IBAction func Stop(theButton: UIButton) {
        WebBrowser.stopLoading()
    }
    
    @IBAction func Reload(theButton: UIButton) {
        WebBrowser.reload()
    }

    func swipeControl() {
        
    }
    
    @IBAction func hideView(thebutton: UIButton) {
        if URL_Bar.hidden == false {
            URL_Bar.hidden = true
        } else {
            URL_Bar.hidden = false
        }
    }
 
}

