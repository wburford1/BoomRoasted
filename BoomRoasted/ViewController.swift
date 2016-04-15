//
//  ViewController.swift
//  BoomRoasted
//
//  Created by Will Burford on 4/14/16.
//  Copyright © 2016 Will Burford. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var currentSound = String()
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        let height = self.view.frame.size.height
        let width = self.view.frame.size.width
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.init(white: 0.5, alpha: 1)
        
        let button = UIButton.init(frame: CGRectMake(width/12, height/4, 10*width/12, height/2))
        button.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.5)
        button.setTitle("ROAST", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.titleLabel?.font = UIFont.init(name: "Papyrus", size: 25)
        button.addTarget(self, action: #selector(roast), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }
    
    func roast(sender:UIButton){
        let soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("roasted1", ofType: "mp3")!)
        playSound(soundURL)
    }
    
    func playSound(url:NSURL){
        do{
            audioPlayer = try AVAudioPlayer(contentsOfURL:url)
            audioPlayer.prepareToPlay()
            do{
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            }
            catch {
                print("error setting category")
            }

            audioPlayer.play()
        }catch {
            print("Error getting the audio file")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

