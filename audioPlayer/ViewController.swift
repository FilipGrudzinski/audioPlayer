//
//  ViewController.swift
//  audioPlayer
//
//  Created by Filip on 10.07.2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    
    @IBOutlet weak var songSlider: UISlider!
    
    @IBAction func songSliderMove(_ sender: Any) {

        
    }
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func volumeSliderMove(_ sender: Any) {
        
        player.volume = volumeSlider.value
        
    }
    
   
    @IBAction func playButton(_ sender: Any) {
        
        player.play()
        
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        
        player.pause()
        
    }
    
    @IBAction func stopButton(_ sender: Any) {
        
        if player.isPlaying {
            
            player.currentTime = 0
            player.play()
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        let audioPath = Bundle.main.path(forResource: "Bach", ofType: "mp3")
        
        do {
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            let audioSession = AVAudioSession.sharedInstance()
            
            do {
                
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                
            } catch {
                
                print(error)
                
            }
            
        } catch {
            
            print(error)
            
        }
        
        /*let audioPath = Bundle.main.path(forResource: "\(filename)", ofType: "\(filetyp)")
        
        do {
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: \(filename)))
            
            
        } catch {
            
            print(error)
            
        } */
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

