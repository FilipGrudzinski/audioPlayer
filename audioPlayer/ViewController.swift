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
    var timer = Timer()
    
    @IBOutlet weak var songSlider: UISlider!
    
    @IBAction func songSliderMove(_ sender: Any) {
        
        player.currentTime = TimeInterval(songSlider.value)
        
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
        timer.invalidate()
        
    }
    
    @IBAction func stopButton(_ sender: Any) {
        
        if player.isPlaying {
            
            player.currentTime = 0
            player.play()
            
        }
        
    }
    
    
    @objc func update() {
        
        songSlider.value = Float(player.currentTime)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let audioPath = Bundle.main.path(forResource: "Bach", ofType: "mp3")
        
        do {
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            songSlider.maximumValue = Float(player.duration)

            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
            
            let audioSession = AVAudioSession.sharedInstance()
            
            do {
                
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                
            } catch {
                
                print(error)
                
            }
            
        } catch {
            
            print(error)
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
      
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

