//
//  CountriesListViewController+Extension.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/11/19.
//  Copyright © 2019 Cesar Armando. All rights reserved.
//

import UIKit
import SVGKit

extension CountriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCountries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CountryTableViewCell.self)") as? CountryTableViewCell else { return CountryTableViewCell() }
        
        cell.countryImage.downloaded(from: filteredCountries[indexPath.row].flag)
        cell.countryName.text = filteredCountries[indexPath.row].name
        cell.selectionStyle = .none
        return cell
    }
}

extension CountriesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.showCountryDetails(viewController: self, country: filteredCountries[indexPath.row])
    }
}

extension CountriesListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredCountries = viewModel
        } else {
            filteredCountries = viewModel.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
