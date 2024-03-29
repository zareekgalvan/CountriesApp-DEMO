//
//  CountriesListPresenter.swift
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

protocol CountriesListPresentationLogic {
  func presentCountries(response: CountriesList.LoadDetail.Response)
}

class CountriesListPresenter: CountriesListPresentationLogic {
  weak var viewController: CountriesListDisplayLogic?
  
  // MARK: Do something
  
  func presentCountries(response: CountriesList.LoadDetail.Response) {
    viewController?.viewModel = response.contries
  }
}
