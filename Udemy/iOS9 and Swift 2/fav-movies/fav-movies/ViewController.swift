//
//  ViewController.swift
//  fav-movies
//
//  Created by Ilya Shaisultanov on 1/12/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewWillAppear(animated: Bool) {
        movies = Movie.getAll()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            cell.configureCell(movie)
            return cell
        } else {
            let cell = MovieCell()
            cell.configureCell(movie)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let movie = movies[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let movieDetail = storyboard.instantiateViewControllerWithIdentifier("movieDetail") as! MovieDetailVC
        
        movieDetail.movie = movie
        
        navigationController?.pushViewController(movieDetail, animated: true)
    }
}

