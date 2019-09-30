//
//  CardViewController.swift
//  DeckOfOneCardGP
//
//  Created by Michael Flowers on 9/30/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var drawCardProperties: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designDrawCardButton()
    }
    
    
    @IBAction func drawButtonPressed(_ sender: UIButton) {
    }
    
    private func designDrawCardButton(){
        drawCardProperties.layer.borderWidth = 2
        drawCardProperties.layer.borderColor = UIColor.black.cgColor
        drawCardProperties.layer.cornerRadius = drawCardProperties.frame.height  /  2
        drawCardProperties.setTitle("Draw New Card", for: .normal)
        drawCardProperties.backgroundColor = .cyan
        drawCardProperties.setTitleColor(.black, for: .normal)
    }
}
