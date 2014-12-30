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
    
//    let swipe = UISwipeGestureRecognizer()
    
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
        
//Refer to: http://stackoverflow.com/questions/24215117/how-to-recognize-swipe-in-all-4-directions
        
//        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swipeControl:")
//        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
//        self.view.addGestureRecognizer(swipeRight)
//        
//        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "swipeControl:")
//        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
//        self.view.addGestureRecognizer(swipeLeft)
//        
//        var swipeDown = UISwipeGestureRecognizer(target: self, action: "swipeControl:")
//        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
//        self.view.addGestureRecognizer(swipeDown)
//        
//        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swipeControl:")
//        swipeUp.direction = UISwipeGestureRecognizerDirection.Down
//        self.view.addGestureRecognizer(swipeUp)
        
        var swipe = UISwipeGestureRecognizer()
        swipe.addTarget(self, action: "swipeControl:") //needed the ":" for it to work
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

    func swipeControl(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            println("swiped");
//            switch swipeGesture.direction {
//            case UISwipeGestureRecognizerDirection.Right:
//                println("Swiped right")
//            case UISwipeGestureRecognizerDirection.Down:
//                println("Swiped down")
//            default:
//                break
//            }
        }
    }
    
    @IBAction func hideView(thebutton: UIButton) {
        if URL_Bar.hidden == false {
            URL_Bar.hidden = true
        } else {
            URL_Bar.hidden = false
        }
    }
 
}

