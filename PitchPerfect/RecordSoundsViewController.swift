//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Heitzeg, William on 12/14/16.
//  Copyright © 2016 tdameritrade. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {

    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var RecordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.enabled=false
    }

    @IBAction func recordAudio(sender: AnyObject) {
        RecordingLabel.text = "Recording in Progress"
        recordButton.enabled=false
        stopRecordingButton.enabled=true
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        
        let filePath = NSURL(string: pathArray.joinWithSeparator("/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, withOptions:AVAudioSessionCategoryOptions.DefaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        RecordingLabel.text = "Tap to Record"
        recordButton.enabled=true
        stopRecordingButton.enabled=false
   }
}

