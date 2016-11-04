//
//  PlaySoundViewController.swift
//  Recorder
//
//  Created by Hemisphere on 21/10/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayNode:AVAudioPlayerNode!
    var stopTimer : Timer!
    
    enum ButtonType : Int { case Slow = 0 ,Fast,ChipMunk,DartVedar,Echo,Reverb}
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySoundViewController view loaded")
        setupAudio()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("Play Sound Button Pressed")
        
        switch (ButtonType(rawValue:sender.tag)!) {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound( rate:  1.5)
        case .ChipMunk:
            playSound(pitch: 1000)
        case .DartVedar:
            playSound(pitch: -1000)
        case .Echo:
            playSound( echo: true)
        case .Reverb:
            playSound(reverb: true)
       
        }
        configureUI(playState: .Playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("Stop Audio Button Pressed")
        stopAudio()
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        print("View will Appear")
        configureUI(playState: .NotPlaying)
        
    }

}
