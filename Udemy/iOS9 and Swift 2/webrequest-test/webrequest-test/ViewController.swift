//
//  ViewController.swift
//  webrequest-test
//
//  Created by Ilya Shaisultanov on 1/16/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let urlStr = "http://swapi.co/api/people/1"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlStr)!
        
        session.dataTaskWithURL(url) { (data: NSData?, res: NSURLResponse?, err: NSError?) -> Void in
            if let data = data {
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)

                    if let dict = json as? Dictionary<String, AnyObject> {
                        if
                            let name = dict["name"] as? String,
                            let height = dict["height"] as? String,
                            let birthYear = dict["birth_year"] as? String,
                            let hairColor = dict["hair_color"] as? String
                        {
                            let p = SWPerson(name: name, height: height, birthYear: birthYear, hairColor: hairColor)
                            print(p.name)
                            print(p.height)
                            print(p.birthYear)
                            print(p.hairColor)
                        }
                    }
                } catch let e as NSError {
                    print("Failed to serialize response as JSON")
                    print(e.debugDescription)
                }
            }
        }.resume()
    }
}

