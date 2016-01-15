//
//  MovieDetailVC.swift
//  fav-movies
//
//  Created by Ilya Shaisultanov on 1/14/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import UIKit
import WebKit

class MovieDetailVC: UIViewController {
    var webView: WKWebView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var contentContainer: UIView!
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
    }

    override func viewWillAppear(animated: Bool) {
        movieImage.image = movie.getMovieImage()
        movieTitle.text = movie.title
        movieDesc.text = movie.desc
        moviePlot.text = movie.plot
    }
    
    @IBAction func onLinkTapped(sender: UIButton) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        let urlStr = movie.url!
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        
        webView.loadRequest(request)
        
        container.addSubview(webView)
        container.hidden = false
    }
    
    @IBAction func onWKCloseTapped(sender: UIBarButtonItem) {
        container.hidden = true
        webView.removeFromSuperview()
    }
}
