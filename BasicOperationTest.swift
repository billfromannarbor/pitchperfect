//
//  BasicOperationTest.swift
//  PitchPerfect
//
//  Created by Heitzeg, William on 12/20/16.
//  Copyright © 2016 tdameritrade. All rights reserved.
//

import XCTest

class BasicOperationTest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
        XCUIDevice.sharedDevice().orientation = .LandscapeLeft
    }
    
    override func tearDown() {
        XCUIDevice.sharedDevice().orientation = .Portrait
        super.tearDown()
    }
    
    func testRecordAndStopRecord() {
        //Wait for Recording button to be available
        let startRecordingButton = XCUIApplication().buttons["startRecording"]
        let stopRecordingButton = XCUIApplication().buttons["stopRecording"]
        let exists = NSPredicate(format: "exists == 1")
        expectationForPredicate(exists, evaluatedWithObject: startRecordingButton, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)
        
        //Tap Recording button
        startRecordingButton.tap()
        
        //Wait for recording status to change
        let recordingstatusStaticText = XCUIApplication().staticTexts["RecordingStatus"]
        let recording = NSPredicate(format: "label == 'Recording in Progress'")
        XCUIDevice.sharedDevice().orientation = .Portrait
        expectationForPredicate(recording, evaluatedWithObject: recordingstatusStaticText, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)


        //Tap Stop Recording button
        stopRecordingButton.tap()

        //Wait for recording status to change
        let waitingToRecord = NSPredicate(format: "label == 'Tap to Record'")
        expectationForPredicate(waitingToRecord, evaluatedWithObject: recordingstatusStaticText, handler: nil)
        waitForExpectationsWithTimeout(5, handler: nil)
    }
    
}
