//
//  ViewController.swift
//  DownloadImage
//
//  Created by Hemisphere on 10/11/16.
//  Copyright © 2016 Hemisphere. All rights reserved.
//

// MARK: Make Network Request

private func getImageFromFlickr() {
    
    let methodParameters = [
        Constants.FlickrParameterKeys.Method: Constants.FlickrParameterValues.GalleryPhotosMethod,
        Constants.FlickrParameterKeys.APIKey: Constants.FlickrParameterValues.APIKey,
        Constants.FlickrParameterKeys.GalleryID: Constants.FlickrParameterValues.GalleryID,
        Constants.FlickrParameterKeys.Extras: Constants.FlickrParameterValues.MediumURL,
        Constants.FlickrParameterKeys.Format: Constants.FlickrParameterValues.ResponseFormat,
        Constants.FlickrParameterKeys.NoJSONCallback: Constants.FlickrParameterValues.DisableJSONCallback
    ]
    
    // create url and request
    let session = URLSession.shared
    let urlString = Constants.Flickr.APIBaseURL + escapedParameters(methodParameters as [String:AnyObject])
    let url = URL(string: urlString)!
    let request = URLRequest(url: url)
    
    // create network request
    let task = session.dataTask(with: request) { (data, response, error) in
        
        // if an error occurs, print it and re-enable the UI
        func displayError(_ error: String) {
            print(error)
            print("URL at time of error: \(url)")
            performUIUpdatesOnMain {
                self.setUIEnabled(true)
            }
        }
        
        /* GUARD: Was there an error? */
        guard (error == nil) else {
            displayError("There was an error with your request: \(error)")
            return
        }
        
        /* GUARD: Did we get a successful 2XX response? */
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
            displayError("Your request returned a status code other than 2xx!")
            return
        }
        
        /* GUARD: Was there any data returned? */
        guard let data = data else {
            displayError("No data was returned by the request!")
            return
        }
        
        // parse the data
        let parsedResult: [String:AnyObject]!
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
        } catch {
            displayError("Could not parse the data as JSON: '\(data)'")
            return
        }
        
        /* GUARD: Did Flickr return an error (stat != ok)? */
        guard let stat = parsedResult[Constants.FlickrResponseKeys.Status] as? String, stat == Constants.FlickrResponseValues.OKStatus else {
            displayError("Flickr API returned an error. See error code and message in \(parsedResult)")
            return
        }
        
        /* GUARD: Are the "photos" and "photo" keys in our result? */
        guard let photosDictionary = parsedResult[Constants.FlickrResponseKeys.Photos] as? [String:AnyObject], let photoArray = photosDictionary[Constants.FlickrResponseKeys.Photo] as? [[String:AnyObject]] else {
            displayError("Cannot find keys '\(Constants.FlickrResponseKeys.Photos)' and '\(Constants.FlickrResponseKeys.Photo)' in \(parsedResult)")
            return
        }
        
        // select a random photo
        let randomPhotoIndex = Int(arc4random_uniform(UInt32(photoArray.count)))
        let photoDictionary = photoArray[randomPhotoIndex] as [String:AnyObject]
        let photoTitle = photoDictionary[Constants.FlickrResponseKeys.Title] as? String
        
        /* GUARD: Does our photo have a key for 'url_m'? */
        guard let imageUrlString = photoDictionary[Constants.FlickrResponseKeys.MediumURL] as? String else {
            displayError("Cannot find key '\(Constants.FlickrResponseKeys.MediumURL)' in \(photoDictionary)")
            return
        }
        
        // if an image exists at the url, set the image and title
        let imageURL = URL(string: imageUrlString)
        if let imageData = try? Data(contentsOf: imageURL!) {
            performUIUpdatesOnMain {
                self.setUIEnabled(true)
                self.photoImageView.image = UIImage(data: imageData)
                self.photoTitleLabel.text = photoTitle ?? "(Untitled)"
            }
        } else {
            displayError("Image does not exist at \(imageURL)")
        }
    }
    
    // start the task!
    task.resume()
}



import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageDownloaded: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageURL = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4decce83c021b48d65650e7dc7723f7c&format=json&nojsoncallback=1&auth_token=72157676317428406-3da153342ed3f2e5&api_sig=1a4636d603a67b401e6d7e000cee83b4")!
       
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            print("task finished")
         let parsedResults:AnyObject!
            if error == nil{
                do{
                parsedResults = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:AnyObject] as AnyObject!
                    print("\(parsedResults)")
                    if let photosDictionary = parsedResults["photos"] as? [String:Any], let photoArray = photosDictionary["photo"] as? [[String:AnyObject]] {
                        print(photoArray[0])
                    }
   
                }catch {
                 print("Error occoured during parsing...")
                }
                
            }
          
        }
        task.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

