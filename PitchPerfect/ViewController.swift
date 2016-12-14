//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Heitzeg, William on 12/14/16.
//  Copyright © 2016 tdameritrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RecordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.enabled=false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(sender: AnyObject) {
        RecordingLabel.text = "Recording in Progress"
        recordButton.enabled=false
        stopRecordingButton.enabled=true
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        RecordingLabel.text = "Tap to Record"
        recordButton.enabled=true
        stopRecordingButton.enabled=false
   }
}

