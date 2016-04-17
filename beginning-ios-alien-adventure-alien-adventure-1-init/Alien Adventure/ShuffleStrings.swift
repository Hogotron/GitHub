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
        print((s1 + s2).characters.count)
        print(shuffle.characters.count)
        
        if (s1 + s2).characters.count != shuffle.characters.count {
            return false
        }
        
        var s1Index = s1.startIndex   // 0
        var s2Index = s2.startIndex   // 0
        //shuffle
        // a c bd
        //index    012
        //string 1 ba_
        //string 2 cd_
        for char in shuffle.characters {
            //char = a
            if s1Index < s1.endIndex && char == s1[s1Index]  {  //ab
                s1Index = s1Index.successor()
            } else if s2Index < s2.endIndex && char == s2[s2Index] {// cd
                s2Index = s2Index.successor()
            } else {
                return false
            }
        }
        
        return true
    }


}



