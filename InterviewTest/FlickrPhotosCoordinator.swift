//
//  FlickrPhotosCoordinator.swift
//  InterviewTest
//
//  Created by Luisa on 08/08/16.
//  Copyright © 2016 Shore GmbH. All rights reserved.
//

import Foundation


struct FlickrPhotosCoordinator {
    
    typealias photosCompletion = (photos: [FlickrPhoto]) -> Void
    
    func loadFlickrImages(completion: photosCompletion){
        let flickr = FlickrKit.sharedFlickrKit()
        let interesting = FKFlickrInterestingnessGetList()
        
        flickr.call(interesting) { (response, error) in
            if error == nil {
                var allPhotos = [FlickrPhoto]()
                
                let topPhotos = response["photos"] as! [NSObject: AnyObject]
                let photoArray = topPhotos["photo"] as! [[NSObject: AnyObject]]
                for photoDictionary in photoArray {
                    let newPhoto = FlickrPhoto(photoData: photoDictionary)
                    allPhotos.append(newPhoto)
                }
                
                completion(photos: allPhotos)
                
            } else {
                print("error: \(error)")
            }
        }
    }
    
}
