//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Gaston Gasquet on 7/30/15.
//  Copyright (c) 2015 Gaston Gasquet. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        audioPlayer = try? AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = try? AVAudioFile(forReading: receivedAudio.filePathUrl)
    }

    
    
    @IBAction func PlaySlowButton(sender: UIButton) {
        PlayBothFastAndSlow(0.5)
        
    }
    
    @IBAction func PlayFastButton(sender: UIButton) {
        PlayBothFastAndSlow(2.0)
        
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        stopAllAudio()
    }
    
    @IBAction func PlayChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
        
        
    }
   
    func playAudioWithVariablePitch(pitch: Float){
        audioEngine.reset()
        stopAllAudio()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        do {
            try audioEngine.startAndReturnError()
        } catch _ {
        }
        
        audioPlayerNode.play()
}

    @IBAction func PlayDarthVaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }

    func PlayBothFastAndSlow(rates: Float) {
        stopAllAudio()
        audioPlayer.play()
        audioPlayer.currentTime = 0
        audioEngine.reset()
        audioPlayer.rate = rates
        
        }

    func stopAllAudio() {
        audioPlayer.stop()
        audioEngine.stop()
    }
    

}







