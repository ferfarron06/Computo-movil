//
//  ImageDownloader.swift
//  Protocol
//
//  Created by Usuario invitado on 22/10/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation
import UIKit
class ImageDownloader {
    var imageUrl: String
    var image: UIImage?
    var delegate: ImageDownloaderDelegate?
    init(imageUrl:String, view:ViewController){
        self.imageUrl = imageUrl
        
    }
    
    func downloadImage(){
        //Aqui se hara todo para bajar la imagen
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            guard
            let imageURLUnwrapped = URL(string: self.imageUrl),
            let imageData = NSData(contentsOf: imageURLUnwrapped),
            let image = UIImage(data: imageData as Data) else{return}
            self.image = image
            print("Image downloaded and set in the instance...")
            DispatchQueue.main.async {
                self.didDownloadImage()
            }
        }
        
    }
    func didDownloadImage(){
        //Que hago una vez que se baje
        print("Now how change the properties of the ViewController?")
        delegate?.didFinishDownload(self)
    
    }
}
