//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(myRobot: ComplexRobotObject) {
        
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        
        isFacingWall(myRobot, direction: myRobot.direction)
        
        if robotIsBlocked {
             myRobot.rotateRight()
         
        } else {
             myRobot.move()
         }
        
        if robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        
        } else {
            continueStraightOrRotate(myRobot)
        }
    }
        
    func previousMoveIsFinished(robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}




