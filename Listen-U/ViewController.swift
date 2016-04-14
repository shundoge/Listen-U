//
//  ViewController.swift
//  Listen-U
//
//  Created by TanakaShunichi on 2016/04/07.
//  Copyright © 2016年 shunichi.tanaka. All rights reserved.
//

import UIKit
import Spring

class ViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var ballView: SpringView!
    @IBAction func ballButtonPressed(sender: AnyObject) {
        
        UIView.animateWithDuration(0.1, animations: {
            self.ballView.backgroundColor = UIColor(hex: "69DBFF")
            }, completion: { finished in
                UIView.animateWithDuration(0.5, animations: {
                    self.ballView.backgroundColor = UIColor(hex: "#279CEB")
                })
        })
        
        animateView()
        
    }
    @IBAction func signInButtonClicked(sender: AnyObject) {
        let signIn = GIDSignIn.sharedInstance()
        signIn.uiDelegate = self
        signIn.signIn()
    }

    
    func animateView() {
        setOptions()
        ballView.animate()
    }
    
    var selectedRow: Int = 0
    var selectedEasing: Int = 0
    
    var selectedForce: CGFloat = 0.9
    var selectedDuration: CGFloat = 3.0
    var selectedDelay: CGFloat = 0.02
    
    var selectedDamping: CGFloat = 0.7
    var selectedVelocity: CGFloat = 0.7
    var selectedScale: CGFloat = 1
    var selectedX: CGFloat = 0
    var selectedY: CGFloat = 0
    var selectedRotate: CGFloat = 0
    var isBall = false

    func setOptions() {
        ballView.force = selectedForce
        ballView.duration = selectedDuration
        ballView.delay = selectedDelay
        
        ballView.damping = selectedDamping
        ballView.velocity = selectedVelocity
        ballView.scaleX = selectedScale
        ballView.scaleY = selectedScale
        ballView.x = selectedX
        ballView.y = selectedY
        ballView.rotate = selectedRotate
        
        ballView.animation = "zoomIn"//animations[14].rawValue
        ballView.curve = animationCurves[selectedEasing].rawValue
    }
    let animations: [Spring.AnimationPreset] = [
        .Shake,
        .Pop,
        .Morph,
        .Squeeze,
        .Wobble,
        .Swing,
        .FlipX,
        .FlipY,
        .Fall,
        .SqueezeLeft,
        .SqueezeRight,
        .SqueezeDown,
        .SqueezeUp,
        .SlideLeft,
        .SlideRight,
        .SlideDown,
        .SlideUp,
        .FadeIn,
        .FadeOut,
        .FadeInLeft,
        .FadeInRight,
        .FadeInDown,
        .FadeInUp,
        .ZoomIn,
        .ZoomOut,
        .Flash
    ]
    
    var animationCurves: [Spring.AnimationCurve] = [
        .EaseIn,
        .EaseOut,
        .EaseInOut,
        .Linear,
        .Spring,
        .EaseInSine,
        .EaseOutSine,
        .EaseInOutSine,
        .EaseInQuad,
        .EaseOutQuad,
        .EaseInOutQuad,
        .EaseInCubic,
        .EaseOutCubic,
        .EaseInOutCubic,
        .EaseInQuart,
        .EaseOutQuart,
        .EaseInOutQuart,
        .EaseInQuint,
        .EaseOutQuint,
        .EaseInOutQuint,
        .EaseInExpo,
        .EaseOutExpo,
        .EaseInOutExpo,
        .EaseInCirc,
        .EaseOutCirc,
        .EaseInOutCirc,
        .EaseInBack,
        .EaseOutBack,
        .EaseInOutBack
    ]

    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
/*    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
*/    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

