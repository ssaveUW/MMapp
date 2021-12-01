//
//  ViewController.swift
//  MMapp
//
//  Created by Shanay Save on 2021-11-14.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let viewModel = MapViewModel()
    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupMapView()
    }
    
    private func setupMapView() {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false   //Lets you use auto layout programatically
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }


}

