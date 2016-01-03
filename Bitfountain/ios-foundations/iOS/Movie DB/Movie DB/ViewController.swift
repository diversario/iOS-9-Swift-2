//
//  ViewController.swift
//  Movie DB
//
//  Created by Ilya Shaisultanov on 1/2/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var studioLabel: UILabel!
    @IBOutlet weak var ratedLabel: UILabel!

    @IBOutlet weak var posterImageView: UIImageView!
    
    let dataRecord = (
        title: "Midnight Run",
        director: "Martin Brest",
        writer: "George Gallo",
        studio: "Universal Studios",
        rated: "R",
        year: "1988"
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = ""
        directorLabel.text = ""
        writerLabel.text = ""
        studioLabel.text = ""
        ratedLabel.text = ""
        
        posterImageView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func retrieveDataButtonTapped(sender: UIButton) {
        posterImageView.hidden = false
        
        titleLabel.text = "\(dataRecord.title) (\(dataRecord.year))"
        directorLabel.text = dataRecord.director
        writerLabel.text = dataRecord.writer
        studioLabel.text = dataRecord.studio
        ratedLabel.text = dataRecord.rated
    }

}

