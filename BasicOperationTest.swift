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
        XCUIDevice.shared().orientation = .landscapeLeft
    }
    
    override func tearDown() {
        XCUIDevice.shared().orientation = .portrait
        super.tearDown()
    }
    
    func testRecordAndStopRecord() {
        //Wait for Recording button to be available
        let startRecordingButton = XCUIApplication().buttons["startRecording"]
        let stopRecordingButton = XCUIApplication().buttons["stopRecording"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: startRecordingButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        //Tap Recording button
        startRecordingButton.tap()
        
        //Wait for recording status to change
        let recordingstatusStaticText = XCUIApplication().staticTexts["RecordingStatus"]
        let recording = NSPredicate(format: "label == 'Recording in Progress'")
        XCUIDevice.shared().orientation = .portrait
        expectation(for: recording, evaluatedWith: recordingstatusStaticText, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)


        //Tap Stop Recording button
        stopRecordingButton.tap()

        //Wait for recording status to change
        let waitingToRecord = NSPredicate(format: "label == 'Tap to Record'")
        expectation(for: waitingToRecord, evaluatedWith: recordingstatusStaticText, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
