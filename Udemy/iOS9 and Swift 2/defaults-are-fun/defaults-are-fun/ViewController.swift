//
//  ViewController.swift
//  defaults-are-fun
//
//  Created by Ilya Shaisultanov on 1/9/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var favLabel: UILabel!

    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            favLabel.text = "Fav color: \(color)"
        } else {
            favLabel.text = "Choose a color already"
        }
        
        let personA = Person(first: "Blang", last: "Chang")
        let personB = Person(first: "Dolan", last: "Thrump")
        let personC = Person(first: "Bob", last: "Belcher")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setValue(peopleData, forKey: "peeps")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func red(sender: UIButton) {
        favLabel.text = "Fav color: red"
        
        NSUserDefaults.standardUserDefaults().setValue("red", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    @IBAction func yellow(sender: UIButton) {
        favLabel.text = "Fav color: yellow"
        NSUserDefaults.standardUserDefaults().setValue("yellow", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func blue(sender: UIButton) {
        favLabel.text = "Fav color: blue"
        NSUserDefaults.standardUserDefaults().setValue("blue", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("peeps") as? NSData {
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person] {
                for person in peopleArray {
                    print(person.firstName)
                }
            }
        }
    }
}

