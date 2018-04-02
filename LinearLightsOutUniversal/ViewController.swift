//
//  ViewController.swift
//  LinearLightsOutUniversal
//
//  Created by FengYizhi on 2018/3/19.
//  Copyright © 2018年 FengYizhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    @IBOutlet var gameBoardBtns: [UIButton]!
    
    var game = LinearLightsOutGame(numLights: 13)
    var hasWon = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStateNavBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)]
        updateView()
    }
    
    @IBAction func pressedNewGameBtn(_ sender: Any) {
        game = LinearLightsOutGame(numLights: 13)
        hasWon = false;
        updateView()
    }
    
    @IBAction func pressedGameBoardBtns(_ sender: Any) {
        let gameBoardBtn = sender as! UIButton
        print(gameBoardBtn.tag)
        hasWon = game!.pressedLight(at: gameBoardBtn.tag)
        updateView()
        print(game!.description());
    }
    
    func updateView() {
        if traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact {
            gameStateLabel.text = hasWon ? "Won in \(game!.movesTaken) moves!!!" : "Moves Taken: \(game!.movesTaken)"
        } else {
            gameStateNavBar.topItem?.title = hasWon ? "Won in \(game!.movesTaken) moves!!!" : "Moves Taken: \(game!.movesTaken)"
        }
        
        for i in 0..<13 {
            let btn = gameBoardBtns[i]
            if game!.isLightOn(at: i) {
                if hasWon {
                    btn.setImage(#imageLiteral(resourceName: "light_on"), for: UIControlState.disabled)
                } else {
                    btn.setImage(#imageLiteral(resourceName: "light_on"), for: UIControlState.normal)
                }
            } else {
                btn.setImage(#imageLiteral(resourceName: "light_off"), for: UIControlState.normal)
            }
        }
    }
    
}

