//
//  MyTableVC.swift
//  table-view-controller-test
//
//  Created by Ilya Shaisultanov on 1/9/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class MyTableVC: UITableViewController {

    var cars = ["BMW", "Ford", "Chevy", "Volvo", "Subaru"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cars.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("carCell", forIndexPath: indexPath)

        cell.textLabel?.text = cars[indexPath.row]
        cell.detailTextLabel?.text = "I like \(cars[indexPath.row])"

        return cell
    }

}
