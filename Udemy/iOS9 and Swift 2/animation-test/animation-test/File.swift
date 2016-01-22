//
//  File.swift
//  animation-test
//
//  Created by Ilya Shaisultanov on 1/21/16.
//  Copyright © 2016 Ilya Shaisultanov. All rights reserved.
//

import Foundation
import UIKit

class FloatingImageView {
    private var _views: [UIView]
    private let _superview: UIView
    private let _imgName: String
    
    init (superview: UIView, imageName: String) {
        self._superview = superview
        self._imgName = imageName
        self._views = [UIView]()
    }
    
    func animate (numberOfViews: Int) {
        for i in 0...numberOfViews {
            _views.append(self._makeView(true))
            _move(_views[i], dist: CGFloat(arc4random_uniform(UInt32(20) + 10)), cb: self._cycle)
        }
    }
    
    private func _cycle (view: UIView) {
        view.removeFromSuperview()
        
        let i = self._views.indexOf(view)!
        
        self._views.removeAtIndex(i)
        
        let newV = self._makeView()
        
        self._views.append(newV)
        
        print("cycle!")
        
        self._move(newV, dist: CGFloat(arc4random_uniform(UInt32(20) + 10)), cb: self._cycle)
    }
    
    private func _makeView (attachToParent: Bool = false) -> UIView {
        let img = UIImage(named: self._imgName)
        let scale = CGFloat(arc4random_uniform(UInt32(7)) + 3) / 10.0
        let alpha = CGFloat(arc4random_uniform(UInt32(5) + 2)) / 10.0
        
        let rect = CGRectMake(
            0,
            CGFloat(arc4random_uniform(UInt32(self._superview.frame.height))),
            img!.size.width * -1 * scale,
            img!.size.height * -1 * scale
        )
        
        let view = UIImageView(frame: rect)
        view.image = img
        view.alpha = alpha
        
        if attachToParent {
            self._superview.addSubview(view)
        }
        
        return view
    }
    
    private func _move(v: UIView, dist: CGFloat = 10, cb: (v: UIView)->() = {_ in }){
        UIView.animateWithDuration(1, delay: 0, options: [.CurveLinear], animations: { () -> Void in
            v.center.x += dist
            }) { (_) -> Void in
                if v.frame.origin.x < self._superview.frame.width {
                    self._move(v, dist: dist, cb: cb)
                } else {
                    print("done moving \(v.frame.origin.x)")
                    cb(v: v)
                }
        }
    }
}