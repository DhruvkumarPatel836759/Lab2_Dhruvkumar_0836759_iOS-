//
//  ViewController.swift
//  Lab2_Dhruvkumar_0836759_iOS
//
//  Created by Dhruv on 2022-01-24.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn
    {
        case o
        case wrong
    }


    @IBOutlet weak var winO: UILabel!
    @IBOutlet weak var winCross: UILabel!
    @IBOutlet weak var m1: UIButton!
    @IBOutlet weak var m2: UIButton!
    
    @IBOutlet weak var m3: UIButton!
    
    @IBOutlet weak var m4: UIButton!
    @IBOutlet weak var m5: UIButton!
    @IBOutlet weak var m6: UIButton!
    @IBOutlet weak var m7: UIButton!
    @IBOutlet weak var m8: UIButton!
    @IBOutlet weak var m9: UIButton!
    @IBOutlet weak var trunofplayer: UILabel!
    
    
       
        
        
        var FirstTurn = Turn.wrong
        var currentTurn = Turn.wrong
        var zero = "0"
        var cross = " X"
        var board = [UIButton]()
 //  var Undo : UIButton
        
        var zeroscore = 0
        var crossscore = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            initBoard()
            let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
            view.addGestureRecognizer(swipeleft)
            
        }
        
        @objc func swipe(gesture : UISwipeGestureRecognizer)
        {
            let swipeGesture = gesture as UISwipeGestureRecognizer
            switch swipeGesture.direction{
                
            case UISwipeGestureRecognizer.Direction.left:
                for button in board
                {
                    button.setTitle(nil, for: .normal)
                    button.isEnabled = true
                    }
                if FirstTurn == Turn.wrong
                {
                    FirstTurn = Turn.o
                    trunofplayer.text = zero
                    
                }
                else if(FirstTurn == Turn.o)
                {
                    FirstTurn = Turn.wrong
                    trunofplayer.text = cross
                }
                currentTurn = FirstTurn
                
                print(" swipe left")
            
            default:
                 break
                
            }
        }
        
        func initBoard(){
            board.append(m1)
            board.append(m2)
            board.append(m3)
            board.append(m4)
            board.append(m5)
            board.append(m6)
            board.append(m7)
            board.append(m8)
            board.append(m9)
        }
      
        @IBAction func tapaction(_ sender: UIButton) {
            actionOnBoard(sender)
//            Undo = sender
            if checkForWinner(cross)
            {
                crossscore += 1
                resultAlert(title: " cross win!!")
            }
            if checkForWinner(zero){
                zeroscore += 1
                resultAlert(title: "zero win!!")
            }
            
            if(fullBoard())
            {
                resultAlert(title: "DRAW")
            }
            winCross.text = String(crossscore)
            winO.text = String(zeroscore)
        }
        
        func resultAlert(title : String)
        {
            _ = "\nZero " + String(zeroscore) + "\n\nCrosses " + String(crossscore)
            let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in self.resetBoard()}))
            self.present(ac , animated: true)
        }
        
        func fullBoard() -> Bool
        {
            for button in board
            {
                
                if  (button.title(for: .normal) == nil )
                {
                return false
                }
            }
            return true
        }
        
        func checkForWinner(_ s: String)-> Bool
        {
            // to check horizontally who is winner
            if thisSymbol(m1, s) && thisSymbol(m2, s) && thisSymbol(m3, s)
            {
                return true
            }
            if thisSymbol(m4, s) && thisSymbol(m5, s) && thisSymbol(m6, s)
            {
                return true
            }
            if thisSymbol(m7, s) && thisSymbol(m8, s) && thisSymbol(m9, s)
            {
                return true
            }
            // to chech vertically who is winner
            if thisSymbol(m1, s) && thisSymbol(m4, s) && thisSymbol(m7, s)
            {
                return true
            }
            if thisSymbol(m2, s) && thisSymbol(m5, s) && thisSymbol(m8, s)
            {
                return true
            }
            if thisSymbol(m3, s) && thisSymbol(m6, s) && thisSymbol(m9, s)
            {
                return true
            }
            
            // to check diagonally who is winner
            if thisSymbol(m1, s) && thisSymbol(m5, s) && thisSymbol(m9, s)
            {
                return true
            }
            if thisSymbol(m3, s) && thisSymbol(m5, s) && thisSymbol(m7, s)
            {
                return true
            }
            return false
        }
        
        func thisSymbol(_ button : UIButton , _ symbol : String )-> Bool
        {
            return button.title(for: .normal) == symbol
        }
        
        func resetBoard()
        {
            for button in board
            {
                button.setTitle(nil, for: .normal)
                button.isEnabled = true
                }
            if FirstTurn == Turn.wrong
            {
                FirstTurn = Turn.o
                trunofplayer.text = zero
                
            }
            else if(FirstTurn == Turn.o)
            {
                FirstTurn = Turn.wrong
                trunofplayer.text = cross
            }
            currentTurn = FirstTurn
        }
        
        func actionOnBoard(_ sender : UIButton){
            if (sender.title(for: .normal) == nil)
            {
                if(currentTurn == Turn.o)
                {
                    sender.setTitle(zero, for: .normal)
                    currentTurn = Turn.wrong
                    trunofplayer.text = cross
                } else if(currentTurn == Turn.wrong)
                {
                    sender.setTitle(cross, for: .normal)
                    currentTurn = Turn.o
                    trunofplayer.text = zero
                }
            }
        }
        
        override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            
           
//            if FirstTurn == Turn.wrong
//            {
//                FirstTurn = Turn.o
//                trunofplayer.text = zero
//
//            }
//            else if(FirstTurn == Turn.o)
//            {
//                FirstTurn = Turn.wrong
//                trunofplayer.text = cross
//            }
//            currentTurn = FirstTurn
//
                
                
                
        }
}

        

    




