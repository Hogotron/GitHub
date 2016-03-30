//
//  RobotTurningInstructions.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/5/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func randomlyRotateRightOrLeft(robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        
        if randomNumber == 0 {
            robot.rotateLeft()
        
        } else {
            robot.rotateRight()
        }
        
    }
    
    func continueStraightOrRotate(robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        
        if randomNumber == 0 {
            robot.move()
        
        } else {
            randomlyRotateRightOrLeft(robot)
        }
        
    }
}