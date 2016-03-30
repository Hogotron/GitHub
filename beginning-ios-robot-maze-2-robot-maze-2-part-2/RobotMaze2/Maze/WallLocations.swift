//
//  CollectingDataAboutWalls.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/6/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func isFacingWall(robot: ComplexRobotObject, direction: MazeDirection) -> Bool {
        
        let cell = mazeController.currentCell(robot)
        var isWall: Bool = false
        
        switch(direction) {
        case .Up:
            if cell.top {
                isWall = true
            }
        case.Down:
            if cell.bottom {
                isWall = true
            }
        case.Left:
            if cell.left {
                isWall = true
            }
        case.Right:
            if cell.right {
                isWall = true
            }
        }
        
        return isWall
    }

    func checkWalls(robot:ComplexRobotObject) -> (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int) {
        var numberOfWalls = 0
        let cell = mazeController.currentCell(robot)
        
        // Check if there is a wall at the top of the current cell
        let isWallUp = cell.top
        if isWallUp {
            numberOfWalls++
        }
        
        // Check if there is a wall to the right of the current cell
        let isWallRight = cell.right
        if isWallRight {
            numberOfWalls++
        }
        
        let isWallBottom = cell.bottom
        if isWallBottom {
            numberOfWalls++
        }
        
        let isWallLeft = cell.left
        if isWallLeft {
            numberOfWalls++
        }
        print(isWallUp, isWallRight, isWallBottom, isWallLeft, 0)
        return (isWallUp, isWallRight, isWallBottom, isWallLeft, 0)
        
    }
}