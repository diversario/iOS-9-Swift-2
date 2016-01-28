import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate { // add the delegate
    let tapGestureRecognizer = UITapGestureRecognizer() // make an instance of tap recognizer
    
    @IBOutlet weak var girImage: UIImageView! // add an outlet for your image view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set your view controller as the delegate for the recognizer
        tapGestureRecognizer.delegate = self
        
        // add your view controller as the target and tell it to call method named "onImageTapped:"
        // Make sure to have that colon at the end!
        tapGestureRecognizer.addTarget(self, action: "onImageTapped:")
        
        // add your recognizer to your image
        girImage.addGestureRecognizer(tapGestureRecognizer)
        
        // enable user interactions or it won't work!
        girImage.userInteractionEnabled = true
    }
    
    func onImageTapped(sender: AnyObject) {
        print("It works from code too!")
    }
}

