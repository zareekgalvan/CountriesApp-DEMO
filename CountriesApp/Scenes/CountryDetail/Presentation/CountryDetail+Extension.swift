//
//  CountryDetail+Extension.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/12/19.
//  Copyright © 2019 Cesar Armando. All rights reserved.
//

import UIKit
import MapKit

extension CountryDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(55.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = view.configureTableSection(labelText: rows[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 16 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FlagTableViewCell.self)") as? FlagTableViewCell else { return FlagTableViewCell() }
            cell.flagImageView.downloaded(from: country?.flag ?? "")
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CountryDetailTableViewCell.self)") as? CountryDetailTableViewCell else { return CountryDetailTableViewCell() }
            
            switch indexPath.section {
            case 0:
                cell.detail.text = country?.topLevelDomain?.first
            case 1:
                cell.detail.text = country?.alpha2Code
            case 2:
                cell.detail.text = country?.callingCodes?.map { "+" + $0 }.joined(separator: "\n")
            case 3:
                cell.detail.text = country?.capital
            case 4:
                cell.detail.text = country?.languages?.compactMap { $0.name }.joined(separator: "\n")
            case 5:
                cell.detail.text = country?.region
            case 6:
                cell.detail.text = country?.subregion
            case 7:
                cell.detail.text = "\(country?.population ?? 0) citizens"
            case 8:
                cell.detail.text = country?.demonym
            case 9:
                cell.detail.text = "\(country?.area ?? 0) km²"
            case 10:
                cell.detail.text = country?.timezones?.joined(separator: "\n")
            case 11:
                cell.detail.text = country?.borders?.joined(separator: "\n")
            case 12:
                cell.detail.text = country?.nativeName
            case 13:
                cell.detail.text = country?.numericCode
            case 14:
                cell.detail.text = country?.currencies?.map {($0.name ?? "") + " - " + ($0.code ?? "")}.joined(separator: "\n")
            case 15:
                cell.detail.text = country?.translations?.translations.joined(separator: "\n")
            default:
                cell.detail.text = ""
            }
            cell.selectionStyle = .none
            return cell
        }
    }
}

extension CountryDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension CountryDetailViewController: MKMapViewDelegate {
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        guard let lat = country?.latlng?[0],
            let long = country?.latlng?[1],
            let radius = country?.area else { return }
        let loc = CLLocation(latitude: lat, longitude: long)
        let coordinateRegion = MKCoordinateRegion(center: loc.coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.addAnnotation(CountryAnotation(title: country?.name ?? "", coordinate: loc.coordinate))
        
        //        let placemark = MKPlacemark(coordinate: loc.coordinate, addressDictionary: nil)
        //        let mapItem = MKMapItem(placemark: placemark)
        //        mapItem.name = country?.name ?? ""
        //        mapItem.openInMaps(launchOptions: [:])
    }
}
