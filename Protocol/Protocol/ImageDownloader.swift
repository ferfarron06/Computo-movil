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
    var view: ViewController
    init(imageUrl:String, view:ViewController){
        self.imageUrl = imageUrl
        self.view = view
    }
    
    func downloadImage(){
        //Aqui se hara todo para bajar la imagen
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            guard
            let imageURLUnwrapped = URL(string: self.imageUrl),
            let imageData = NSData(contentsOf: imageURLUnwrapped),
                let image = UIImage(data: imageData as Data) else{return}
        }
        
    }
    func didDownloadImage(){
        //Que hago una vez que se baje
    
    }
}
