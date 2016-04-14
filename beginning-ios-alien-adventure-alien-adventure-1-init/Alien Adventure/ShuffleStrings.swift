//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1 s1: String, s2: String, shuffle: String) -> Bool {
        
        if s1.isEmpty && s2.isEmpty && shuffle.isEmpty {
            return true
        }
    
        if (s1 + s2).characters.count != shuffle.characters.count {
            return false
        }
        
        var s1Index = s1.startIndex
        var s2Index = s2.startIndex
        
        for char in shuffle.characters {
            if char == s1[s1Index] {
                s1Index = s1Index.successor()
                
            }
            
            if char == s2[s2Index] {
                s2Index = s2Index.successor()
                
            
            } else if s1Index == s2Index {
                return true
            
            } else if s1Index != s2Index {
                return false
            }
                
            }
        
        
        
        
        
        return false
    }
    
    
}

