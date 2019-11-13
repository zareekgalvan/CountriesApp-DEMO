//
//  CountryDetailViewController.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/11/19.
//  Copyright (c) 2019 Cesar Armando. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import MapKit

protocol CountryDetailDisplayLogic: class {
    
    var country: Country? { get set }
}

class CountryDetailViewController: UIViewController, CountryDetailDisplayLogic {
    
    enum rowType {
        case multiple
        case single
        case photo
    }
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var countryDetailTableView: UITableView!
    var interactor: CountryDetailBusinessLogic?
    var router: (NSObjectProtocol & CountryDetailRoutingLogic & CountryDetailDataPassing)?
    var country: Country? {
        didSet {
            self.showData()
        }
    }
    
    let rows = ["Domain", "Alpha Code", "Calling Codes", "Capital", "Languages", "Region", "Subregion", "Population", "Nationality", "Area", "Timezones", "Frontiers", "Native names", "Numeric code", "Currency", "Translations", "Flag"]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = CountryDetailInteractor()
        let presenter = CountryDetailPresenter()
        let router = CountryDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.presentCountry()
        self.countryDetailTableView.dataSource = self
        self.countryDetailTableView.delegate = self
        self.countryDetailTableView.register(UINib(nibName: "\(CountryDetailTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(CountryDetailTableViewCell.self)")
        self.countryDetailTableView.register(UINib(nibName: "\(FlagTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(FlagTableViewCell.self)")
        self.mapView.delegate = self
    }
    
    func showData() {
        self.title = country?.name ?? ""
    }
    
    @IBAction func openinMaps(_ sender: Any) {
        let alert = UIAlertController(title: "Open in Maps", message: "Do you want to open this location in Maps?", preferredStyle: .actionSheet)
        let open = UIAlertAction(title: "Open", style: .default) { (_) in
            let regionDistance:CLLocationDistance = self.country?.area ?? 0
            let regionSpan = MKCoordinateRegion(center: self.mapView.centerCoordinate, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: self.mapView.centerCoordinate, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = self.country?.name ?? ""
            mapItem.openInMaps(launchOptions: options)
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(open)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
}