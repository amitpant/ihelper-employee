//
//  SelectServiceAreaVC.swift
//  I-HelperEmployee
//
//  Created by Maxtra Technologies P LTD on 21/08/17.
//  Copyright © 2017 Maxtra Technologies P LTD. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class SelectServiceAreaVC: UIViewController, UISearchBarDelegate , LocateOnTheMap,GMSAutocompleteFetcherDelegate  {

    /**
     * Called when an autocomplete request returns an error.
     * @param error the error that was received.
     */
    public func didFailAutocompleteWithError(_ error: Error) {
        //        resultText?.text = error.localizedDescription
    }
    
    /**
     * Called when autocomplete predictions are available.
     * @param predictions an array of GMSAutocompletePrediction objects.
     */
    public func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
        //self.resultsArray.count + 1
        
        for prediction in predictions {
            
            if let prediction = prediction as GMSAutocompletePrediction!{
                self.resultsArray.append(prediction.attributedFullText.string)
            }
        }
        self.searchResultController.reloadDataWithArray(self.resultsArray)
        //   self.searchResultsTable.reloadDataWithArray(self.resultsArray)
        print(resultsArray)
    }
    
    
    @IBOutlet weak var googleMapsContainer: UIView!
    
    var googleMapsView: GMSMapView!
    var searchResultController: SearchResultsController!
    var resultsArray = [String]()
    var gmsFetcher: GMSAutocompleteFetcher!
    
    @IBAction func submitPressed(_ sender: Any) {
        
        
        guard let mainView = UIStoryboard(name: Screens.SideMenu.name(), bundle: nil).instantiateInitialViewController() as? CustomSideMenuViewController
            else{
                return
        }
        //UserDefaults.standard.set(true, forKey: "isNotFirstTime")
        UIApplication.shared.keyWindow?.rootViewController = mainView
        
        
        /* CustomActivityIndicator.shared.showActivityIndicator(view: self.view)
         
         
                        let params = ["device_token":"","device_type":"I","email":"\(emailid)","mobile":"\( mobileNo)","name":"\(name)"]
                        print(params)
                        NetworkClient.shared.downloadDataWithAPIName(apiname: "signup", params: params, success: { [weak self]  (serverResponse) in
                            print(serverResponse)
                            if serverResponse["status"] as! Bool && serverResponse["isarray"] as! Bool{
                                if let data = serverResponse["data"] as? [String:Any] {
                                    DispatchQueue.main.async {
                                        guard let strongSelf = self else{return}
                                        if let userObject = User(json: data){
                                            let userData  = NSKeyedArchiver.archivedData(withRootObject: userObject)
                                            UserDefaults.standard.set(userData, forKey: "userObject")
                                            CustomActivityIndicator.shared.hideActivityIndicator(view: strongSelf.view)
                                            
                                            guard let mainView = UIStoryboard(name: Screens.SideMenu.name(), bundle: nil).instantiateInitialViewController() as? CustomSideMenuViewController
                                                else{
                                                    return
                                            }
                                            UserDefaults.standard.set(true, forKey: "isNotFirstTime")
                                            UIApplication.shared.keyWindow?.rootViewController = mainView
                                        }
                                    }
                                }
                            }else{
                                print(serverResponse["message"] as! String)
                            }
                            
                        }) { (error) in
                            print(error)
                        }
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.googleMapsView = GMSMapView(frame: self.googleMapsContainer.bounds)
        self.view.addSubview(self.googleMapsView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.searchWithAddress))
        searchResultController = SearchResultsController()
        searchResultController.delegate = self
        gmsFetcher = GMSAutocompleteFetcher()
        gmsFetcher.delegate = self
        
    }
    
    /**
     action for search location by address
     
     - parameter sender: button search location
     */
    @IBAction func searchWithAddress(_ sender: AnyObject) {
        let searchController = UISearchController(searchResultsController: searchResultController)
        searchController.searchBar.placeholder = "Search your location"
        searchController.searchBar.delegate = self
        
        
        
        self.present(searchController, animated:true, completion: nil)
        
        
    }
    
    /**
     Locate map with longitude and longitude after search location on UISearchBar
     
     - parameter lon:   longitude location
     - parameter lat:   latitude location
     - parameter title: title of address location
     */
    func locateWithLongitude(_ lon: Double, andLatitude lat: Double, andTitle title: String) {
        
        
        
        DispatchQueue.main.async { () -> Void in
            
            let position = CLLocationCoordinate2DMake(lat, lon)
            let marker = GMSMarker(position: position)
            
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 10)
            self.googleMapsView.camera = camera
            
            marker.title = "Address : \(title)"
            marker.map = self.googleMapsView
            
        }
        
    }
    
    /**
     Searchbar when text change
     
     - parameter searchBar:  searchbar UI
     - parameter searchText: searchtext description
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //        let placeClient = GMSPlacesClient()
        //
        //
        //        placeClient.autocompleteQuery(searchText, bounds: nil, filter: nil)  {(results, error: Error?) -> Void in
        //           // NSError myerr = Error;
        //            print("Error @%",Error.self)
        //
        //            self.resultsArray.removeAll()
        //            if results == nil {
        //                return
        //            }
        //
        //            for result in results! {
        //                if let result = result as? GMSAutocompletePrediction {
        //                    self.resultsArray.append(result.attributedFullText.string)
        //                }
        //            }
        //
        //            self.searchResultController.reloadDataWithArray(self.resultsArray)
        //
        //        }
        
        
        self.resultsArray.removeAll()
        gmsFetcher?.sourceTextHasChanged(searchText)
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
