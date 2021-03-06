//
//  HUD.swift
//  Zylon Defenders
//
//  Created by Jeffery Glasse on 12/30/16.
//  Copyright © 2016 Jeffery Glasse. All rights reserved.
//

//
import UIKit
import SpriteKit
import AVFoundation
import SceneKit

class HUD: SKScene {
    var shields: SKShapeNode!
    var crosshairs: SKSpriteNode!
    var aftcrosshairs: SKSpriteNode!
    var parentScene: GameViewController?
    public var computerStatus = SKLabelNode()
    private let aftHairs = SKSpriteNode(imageNamed: "xenonHUDAFT")
    private let foreHairs = SKSpriteNode(imageNamed: "xenonHUD")

    var timer: Timer?
    var currentComputerStatusColor = UIColor.red

	var tacticalDisplay = [SKSpriteNode]()

    @objc func blinkComputerDisplay() {
        if computerStatus.fontColor == currentComputerStatusColor {computerStatus.fontColor = UIColor.clear} else {computerStatus.fontColor = currentComputerStatusColor}

    }

	func defineTacticalDisplay() {

	}
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = UIColor.clear
        shields = SKShapeNode(rectOf: size)
        shields.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        shields.alpha = 0.0
        shields.fillColor = SKColor.blue
        shields.strokeColor =  UIColor.clear
        computerStatus.fontName = "Y14.5M 17.0"
        computerStatus.fontSize = 9
        computerStatus.fontColor = UIColor.red
        computerStatus.position = CGPoint(x: self.frame.midX, y: self.frame.maxY-40)
        computerStatus.text = "GRIDWARP ENGINES OFFLINE"

		defineTacticalDisplay()

        self.addChild(shields)

        crosshairs = foreHairs
        crosshairs.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(crosshairs)

        self.addChild(computerStatus)
        //self.activateAlert()

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }

    func foreView() {
        crosshairs=foreHairs
    }

    func aftView() {
        crosshairs=aftHairs
    }
    func activateAlert() {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                              selector: #selector(self.blinkComputerDisplay), userInfo: nil, repeats: true)
        }
    }

	func toggleShields() {

        if (parentScene?.ship.shields)! {
			shields.alpha = 0
			parentScene?.ship.shields = false
        } else {
			shields.alpha = 0.2
			parentScene?.ship.shields = true
		}

    }

}
