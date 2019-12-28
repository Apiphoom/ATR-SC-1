//
//  ViewController.swift
//  
//
//  Created by Apiphoom Chuenchompoo on 13/12/2562 BE.
//  Copyright © 2562 Apiphoom Chuenchompoo. All rights reserved.
//
import AVFoundation
import UIKit
import LocalAuthentication
import MapKit
import CoreLocation
import SystemConfiguration
import Foundation


class ViewController: UIViewController, CLLocationManagerDelegate {
    var audioPlayer:AVAudioPlayer?
    @IBAction func Unlock(_ sender: Any)
{
        let context:LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        
        {
            
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please verify your identity with Face ID ", reply: { ( wasCorrect, Error) in
                if wasCorrect
                
                {
                    let url = Bundle.main.url(forResource: "unlock", withExtension: "mp3")

                           guard url != nil else {
                               return
                           }
                           
                           do{
                            self.audioPlayer = try AVAudioPlayer(contentsOf: url!)
                            self.audioPlayer?.play()
                           }
                           catch{
                               print("error")
                           }
                }
                
                else
                {

            
                print("incorrect")
                } })
        }
        
    
    }
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!END OF UNLOCK SOUND AND FACE ID!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    @IBAction func lock(_ sender: Any) {
        
        let context:LAContext = LAContext()
                      
                      if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
                      
                      {
                          
                          context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please verify your identity with Face ID ", reply: { ( wasCorrect, Error) in
                              if wasCorrect
                              
                              {
                                 let url = Bundle.main.url(forResource: "lock", withExtension: "mp3")

                                 guard url != nil else {
                                     return
                                 }
                                 
                                 do{
                                    self.audioPlayer = try AVAudioPlayer(contentsOf: url!)
                                    self.audioPlayer?.play()
                                 }
                                 catch{
                                     print("error")
                                 }

                              }
                              
                              
                              else
                              {
                                  
                              print("incorrect")
                              }
                          
                          
                          
                          
                          })
                      }
    }
    
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!END OF LOCK SOUND AND FACE ID!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 
    
    
    
    
    
    
    
    @IBOutlet weak var mapView: MKMapView!

    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
           super.viewDidLoad()
        
        if #available(iOS 13.0, *){
            
            overrideUserInterfaceStyle = .light
        }
        
       
        
        
        scmode2.isHidden = true
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
       }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
       
    
    
        
    
    
    
    }
    
   
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!END OF USER LOCATION(MAP)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    
    
    @IBOutlet weak var status: UIImageView!
    @IBOutlet weak var offline: UIImageView!
    @IBOutlet weak var incorrect: UIImageView!
    @IBOutlet weak var incorrect2: UIImageView!
    @IBOutlet weak var lockUnknown: UIImageView!
    @IBOutlet weak var lockUnknown2: UIImageView!
    @IBOutlet weak var incorrect3: UIImageView!
    
    @IBOutlet weak var red1: UIImageView!
    @IBOutlet weak var red2: UIImageView!
    @IBOutlet weak var autolock: UILabel!
    @IBOutlet weak var keyunlock: UILabel!
    @IBOutlet weak var SCmode: UIImageView!
    @IBOutlet weak var scmode2: UIImageView!
    
    
        override func viewDidAppear(_ animated: Bool)
    
    {
         
        if CheckInternet.Connection()
        {
            SCmode.isHidden = true
            autolock.isHidden = true
            keyunlock.isHidden = true
            red1.isHidden = true
            red2.isHidden = true
            status.isHidden = false
            offline.isHidden = true
            incorrect.isHidden = true
            incorrect2.isHidden = true
            lockUnknown.isHidden = true
            lockUnknown2.isHidden = true
            incorrect3.isHidden = true
            
            
           }
               
       else {
            do {
                                           let url = Bundle.main.url(forResource: "secure", withExtension: "mp3")

                                           guard url != nil else {
                                               return
                                           }
                                           
                                           do{
                                              self.audioPlayer = try AVAudioPlayer(contentsOf: url!)
                                              self.audioPlayer?.play()
                                           }
                                           catch{
                                               print("error")
                                           }

                   
            }
            SCmode.isHidden = false
            autolock.isHidden = false
            keyunlock.isHidden = false
           red1.isHidden = false
            red1.loadGif(name: "REDD")
           red2.isHidden = false
            red2.loadGif(name: "REDD")
            status.isHidden = true
            offline.isHidden = false
            incorrect.isHidden = false
            incorrect2.isHidden = false
            lockUnknown.isHidden = false
            lockUnknown2.isHidden = false
            incorrect3.isHidden = false
            
            
           }
        
        
        
        }
       
       func Alert (Message: String){
           
           let alert = UIAlertController(title: "Internet Connection Lost", message: Message, preferredStyle: UIAlertController.Style.alert)
           alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
           self.present(alert, animated: true, completion: nil)
           
         
       
           
           
       }
   
   
    @IBAction func RE(_ sender: Any){
        
        if scmode2.isHidden == false
            
        
        {
        
        }else {
            self .viewDidLoad();
            self .viewDidAppear(true)
        }
    }
    

    @IBAction func RELOGO(_ sender: Any) {
        
        if scmode2.isHidden == false
                  
              
              {
              
              }else {
                  self .viewDidLoad();
                  self .viewDidAppear(true)
              }
    }
    
    
    @IBAction func entersc(_ sender: Any)
        
    
    {
        
        if SCmode.isHidden == false {
            
        } else {
    
       do {
                                       let url = Bundle.main.url(forResource: "securemd", withExtension: "mp3")

                                       guard url != nil else {
                                           return
                                       }
                                       
                                       do{
                                          self.audioPlayer = try AVAudioPlayer(contentsOf: url!)
                                          self.audioPlayer?.play()
                                       }
                                       catch{
                                           print("error")
                                       }

               
        }
        
        
        scmode2.isHidden = false
        autolock.isHidden = false
        keyunlock.isHidden = false
        
        
        
        
    }
    }
    
    
    
    
    @IBAction func exitsc(_ sender: Any) {
        
        
        if SCmode.isHidden == false {
        }
        else{ let context:LAContext = LAContext()
                             
                             if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
                             
                             {
                                 
                                 context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please verify your identity with Face ID ", reply: { ( wasCorrect, Error) in
                                     if wasCorrect
                                     
                                     {  do {
                                                                              let url = Bundle.main.url(forResource: "exsecure", withExtension: "mp3")

                                                                              guard url != nil else {
                                                                                  return
                                                                              }
                                                                              
                                                                              do{
                                                                                 self.audioPlayer = try AVAudioPlayer(contentsOf: url!)
                                                                                 self.audioPlayer?.play()
                                                                              }
                                                                              catch{
                                                                                  print("error")
                                                                              }

                                                      
                                               }
                                        
                                        
                                    DispatchQueue.main.async {
                                           
                                            self.scmode2.isHidden = true
                                            self.autolock.isHidden = true
                                            self.keyunlock.isHidden = true
                                        }

                                     }
                                     
                                     
                                     else
                                     {
                                         
                                     print("incorrect")
                                     }
                                 
                                 
                                 
                                 
                                 })
                             }
        
    }
    
}
    
    
    
}
        

        
       







