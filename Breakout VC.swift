//
//  Breakout VC.swift
//  Games
//
//  Created by period4 on 4/27/21.
//

import UIKit
import AVFoundation

class Breakout_VC: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var paddleView: UIView!
    
    @IBOutlet weak var ball: UIView!
    
    @IBOutlet weak var brick1: UIView!
    @IBOutlet weak var brick2: UIView!
    @IBOutlet weak var brick3: UIView!
    @IBOutlet weak var brick4: UIView!
    @IBOutlet weak var brick5: UIView!
    @IBOutlet weak var brick6: UIView!
    @IBOutlet weak var brick7: UIView!
    @IBOutlet weak var brick8: UIView!
    @IBOutlet weak var brick9: UIView!
    @IBOutlet weak var brick10: UIView!
    @IBOutlet weak var brick11: UIView!
    @IBOutlet weak var brick12: UIView!
    @IBOutlet weak var brick13: UIView!
    @IBOutlet weak var brick14: UIView!
    @IBOutlet weak var brick15: UIView!
    @IBOutlet weak var brick16: UIView!
    @IBOutlet weak var brick17: UIView!
    @IBOutlet weak var brick18: UIView!
    @IBOutlet weak var brick19: UIView!
    @IBOutlet weak var brick20: UIView!

    @IBOutlet weak var startButtonOutlet: UIButton!
    
    
  
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior: UICollisionBehavior!
    var allBricks = [UIView]()
    var ballDynamics: UIDynamicItemBehavior!
    var paddleDynamics: UIDynamicItemBehavior!
    var brickDynamics: UIDynamicItemBehavior!
    
    var brickCount = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.layer.cornerRadius = 15
        allBricks = [brick1, brick2, brick3, brick4, brick5, brick6, brick7, brick8, brick9, brick10, brick11, brick12, brick13, brick14, brick15, brick16, brick17, brick18, brick19, brick20]
        ball.isHidden = true
        paddleView.isHidden = true
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        paddleView.center = CGPoint(x: sender.location(in: view).x, y: paddleView.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddleView)
        
    }
    func dynamicBehaviors() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ball], mode: .instantaneous)
        pushBehavior.pushDirection = CGVector(dx: 0.5, dy: 0.5)
        pushBehavior.active = true
        pushBehavior.magnitude = 0.3
        pushBehavior.angle = 3.12
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [ball, paddleView] + allBricks)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        collisionBehavior.collisionDelegate = self
        
        ballDynamics = UIDynamicItemBehavior(items: [ball])
        ballDynamics.allowsRotation = true
        ballDynamics.elasticity = 1.2
        ballDynamics.friction = 0
        ballDynamics.resistance = 0
        dynamicAnimator.addBehavior(ballDynamics)
        
        paddleDynamics = UIDynamicItemBehavior(items: [paddleView])
        paddleDynamics.friction = 0
        paddleDynamics.density = 1000000
        paddleDynamics.elasticity = 0.05
        paddleDynamics.allowsRotation = false
        dynamicAnimator.addBehavior(paddleDynamics)
        
      
        brickDynamics = UIDynamicItemBehavior(items: allBricks)
        brickDynamics.elasticity = 0.6
        brickDynamics.density = 2000000
        brickDynamics.allowsRotation = false
        dynamicAnimator.addBehavior(brickDynamics)
    }
    
@IBAction func startButton(_ sender: UIButton) {
    sender.isHidden = true
    paddleView.isHidden = false
    ball.isHidden = false
    dynamicBehaviors()
    let sound = AVSpeechSynthesizer()
    let utterance = AVSpeechUtterance(string: "good luck")
    sound.speak(utterance)
    

}
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        if p.y > paddleView.center.y {
            alert()
        }
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        if item1.isEqual(ball) && item2.isEqual(allBricks) {
            for brick in allBricks {
                if item1.isEqual(ball) && item2.isEqual(allBricks) {
                    brick.isHidden = true
                    collisionBehavior.removeItem(brick)
                    brickCount = brickCount - 1
                    print(brickCount)
                    if brickCount == 0 {
                        alert()
                        ball.isHidden = true
                        startButtonOutlet.isHidden = false
                    }
                }
            }
    }
    }
    func alert() {
        let losingAlert = UIAlertController(title: "L", message: "Unlucky, you'll get em nect time!", preferredStyle: .alert)
        let newGameButton = UIAlertAction(title: "New Game", style: .default) { (action) in self.reset()
            }
        losingAlert.addAction(newGameButton)
        present(losingAlert, animated: true, completion: nil)
    }
 
    func reset() {
        
    }
  
  
        
    
    
}


