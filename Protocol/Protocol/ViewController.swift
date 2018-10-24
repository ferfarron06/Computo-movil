//
//  ViewController.swift
//  Protocol
//
//  Created by Usuario invitado on 22/10/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ImageDownloaderDelegate {
   

    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    var imageDownloader: ImageDownloader?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        loadingLabel.isHidden = true
        let imageUrl: String = "https://www.hogarmania.com/archivos/201710/animales-quokka-marsupial-848x477x80xX.jpg"
        imageDownloader = ImageDownloader(imageUrl: imageUrl, view: self)
        imageDownloader?.delegate = self
        imageDownloader?.downloadImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didFinishDownload(_ sender: ImageDownloader) {
        imageView.image = sender.image
        loadingLabel.isHidden = false
        imageView.isHidden = false
        activityIndicator.isHidden = true
        loadingLabel.text = "Quokka"
    }
}

