
import UIKit
import MapKit
import CoreLocation
import AuthenticationServices
import LocalAuthentication

class ViewController3: UIViewController, CLLocationManagerDelegate {
    let context:LAContext = LAContext()
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var uninter: UIImageView!
    @IBOutlet weak var RED1: UIImageView!
    @IBOutlet weak var RED2: UIImageView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CheckInternet.Connection(){
            uninter.isHidden = true
            RED1.isHidden = true
            RED2.isHidden = true
            
        }else {
            
            
            
            
            uninter.isHidden = false
            RED1.isHidden = false
            RED1.loadGif(name: "REDD")
            RED2.isHidden = false
            RED2.loadGif(name: "REDD")
            
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        mapView.showsUserLocation = true
        
        if CLLocationManager.locationServicesEnabled() == true {
            
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied || CLLocationManager.authorizationStatus() == .notDetermined {
                
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            
        } else {
            print("PLease turn on location services or GPS")
        }
    }
    
    
    //MARK:- CLLocationManager Delegates
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        self.mapView.setRegion(region, animated: true)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access your current location")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func RE(_ sender: Any) {
    
    
     
       self .viewDidLoad();
           self .viewDidAppear(true)
       }
    
   

   
    @IBAction func RELOGO(_ sender: Any) {
    
    self .viewDidLoad();
        self .viewDidAppear(true)
    }
      
    @IBAction func back(_ sender: Any) {
        
        
        
        
                       
                       if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
                       
                       {
                           
                           context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please verify your identity with Face ID ", reply: { ( wasCorrect, Error) in
                               if wasCorrect
                               
                               {
                                DispatchQueue.main.async { self.performSegue(withIdentifier: "Api", sender: self)
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



