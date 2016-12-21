//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Heitzeg, William on 12/14/16.
//  Copyright © 2016 tdameritrade. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

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
        print("XXXXXXXXXXXXXXXXXXX  RecordButton Enabled = " + recordButton.enabled.description)
        stopRecordingButton.enabled=true
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        
        let filePath = NSURL(string: pathArray.joinWithSeparator("/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, withOptions:AVAudioSessionCategoryOptions.DefaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate=self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        recordButton.enabled=true
        stopRecordingButton.enabled=false
        RecordingLabel.text = "Tap to Record"
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        }
        else {
            print("recording was not successful")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}

