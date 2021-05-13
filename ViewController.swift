    //
//  ViewController.swift
//  Games
//
//  Created by period4 on 4/5/21.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    @IBOutlet weak var labelSeven: UILabel!
    @IBOutlet weak var labelEight: UILabel!
    @IBOutlet weak var labelNine: UILabel!
    
    
    @IBOutlet weak var turnLabel: UILabel!
    
    
    @IBOutlet weak var myView: UIView!
    
    
    
    var alllabels: [UILabel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alllabels = [labelOne, labelTwo, labelThree, labelFour, labelFive, labelSix, labelSeven, labelEight, labelNine]
        var soccer = true
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        let SelectedPoint = sender.location(in: view)
        for label in alllabels
        {
            if label.frame.contains(SelectedPoint)
            {
                placeInToLabel(myLabel: label)
            }
        }
        checkForWinner()
    }

    func alert() {
        let winningAlert = UIAlertController(title: "W", message: "Nice job!", preferredStyle: .alert)
        present(winningAlert, animated: true, completion: nil)
        let newGameButton = UIAlertAction(title: "New Game", style: .default) { (action) in self.reset()
            }
        winningAlert.addAction(newGameButton)
    }

//Use the parameter in conditional
func placeInToLabel(myLabel: UILabel){
        if myLabel.text == "" {
            if turnLabel.text == "X" {
                myLabel.text = turnLabel.text
                turnLabel.text = "O"
            }
        else {
             myLabel.text = turnLabel.text
             turnLabel.text = "X"
        }
   }
}
 
    func checkForWinner()

        {

        if  labelOne.text == labelTwo.text && labelTwo.text == labelThree.text  && labelOne.text != ""
        {
           alert()
        }

            

        if   labelOne.text == labelFour.text && labelFour.text == labelSeven.text  && labelOne.text != ""
        {
            alert()
        }
            
        if   labelOne.text == labelFive.text && labelFive.text == labelNine.text  && labelOne.text != ""
        {
             alert()
        }

        if labelTwo.text == labelFive.text && labelFive.text == labelEight.text  && labelTwo.text != ""
        {
            alert()
        }
        
        if labelFour.text == labelFive.text && labelFive.text == labelEight.text  && labelFour.text != ""
        {
        alert()
            
        }
        
        if labelThree.text == labelSix.text && labelSix.text == labelNine.text  && labelThree.text != ""
        {
            alert()
        }
        
       if labelSeven.text == labelEight.text && labelEight.text == labelNine.text  && labelSeven.text != ""
       {
        alert()
       }
        
        if labelThree.text == labelFive.text && labelFive.text == labelSeven.text  && labelThree.text != ""
        {
            alert()
        }

    }

    @IBAction func resetButton(_ sender: Any) {
        reset()
    }
    
    func reset() {
        for label in alllabels{
            label.text = ""
            print(label)
            
        }
    }
    
}
    
    

