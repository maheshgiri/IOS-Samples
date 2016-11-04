//
//  ViewController.swift
//  Recorder
//
//  Created by Hemisphere on 21/10/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

import UIKit
import AVFoundation
class RecordAudiosView : UIViewController,AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var recordLable: UILabel!
    @IBOutlet weak var stopRecordBtn: UIButton!
    var audioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     print("started app")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

    @IBAction func startRecording(_ sender: Any) {
        print("start recording")
        stopRecordBtn.isEnabled=true
        recordBtn.isEnabled=false
        recordLable.text="started recording"
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURL(withPathComponents: pathArray)
        print("File path \(filePath)")
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    
    }
    
    
    
    @IBAction func stopRecording(_ sender: Any) {
        stopRecordBtn.isEnabled=false
        print("stop recording")
        recordBtn.isEnabled=true
        recordLable.text="stopped recording"
        audioRecorder.stop()
    }
 
   
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if (flag){
        print("recorder stopped and saved")
            self.performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }
        else {
            print("some error happened..")        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="stopRecording"){
            print("Segue Received")
            let playSoundsVC = segue.destination as! PlaySoundViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
        else{
            print("Segue Not Received")
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("View will Appear")
        stopRecordBtn.isEnabled=false
        recordBtn.isEnabled=true
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("Did View Appear")
    }
    
   }
