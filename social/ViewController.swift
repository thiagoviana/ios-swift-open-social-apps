//
//  ViewController.swift
//  social
//
//  Created by Thiago Viana on 31/07/18.
//  Copyright © 2018 Thiago Viana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openSocialFacebook(_ sender: Any) {
        
        let screenName =  "appdaagua"
        let pageID = "1549981958628014"; // App da Água Fanpage ID
        
        let appURL = URL(string: "fb://profile/" + pageID)!
        let webURL = URL(string: "https://www.facebook.com/\(screenName)")!
        
        openSocial(appURL: appURL, webURL: webURL);
    }
    
    @IBAction func openSocialTwitter(_ sender: Any) {
        
        let screenName =  "appdaagua"
        let appURL = URL(string: "twitter://user?screen_name=\(screenName)")!
        let webURL = URL(string: "https://twitter.com/\(screenName)")!
        
        openSocial(appURL: appURL, webURL: webURL);
    }
    
    @IBAction func openSocialLinkedIn(_ sender: Any) {
        
        let screenName =  "appdaagua"
        let appURL = URL(string: "linkedin://#profile/\(screenName)")!
        let webURL = URL(string: "https://linkedin.com/company/\(screenName)")!
        
        openSocial(appURL: appURL, webURL: webURL);
    }
    
    
    @IBAction func openSocialInstagram(_ sender: Any) {
        
        let screenName =  "appdaagua"
        let appURL = URL(string: "instagram://user?screen_name=\(screenName)")!
        let webURL = URL(string: "https://instagram.com/\(screenName)")!
        
        openSocial(appURL: appURL, webURL: webURL);
    }

    func openSocial(appURL: URL, webURL: URL) {
        
        // app installed : open
        if UIApplication.shared.canOpenURL(appURL as URL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL as URL)
            }
        } else {
            // app not found : redirect to safari
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(webURL as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(webURL as URL)
            }
        }
    }
}

