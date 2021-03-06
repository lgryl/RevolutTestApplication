//
//  ConverterPresenter.swift
//  RevolutTestApplication
//
//  Created by lg on 26/01/2019.
//  Copyright © 2019 lg. All rights reserved.
//

import Foundation

class ConverterPresenter {
    weak var viewController: ConverterDisplayable!
    let dataProvider: ConverterDataProvider
    let ratesFetchService = ApiFetchRatesService()
    let ratesManager: RatesManager
    let amountsManager: AmountsManager
    
    init(dataProvider: ConverterDataProvider, ratesManager: RatesManager, amountsManager: AmountsManager) {
        self.ratesManager = ratesManager
        self.amountsManager = amountsManager
        self.amountsManager.ratesManager = self.ratesManager
        self.dataProvider = dataProvider
        self.dataProvider.amountsManager = amountsManager
        
        scheduleRatesFetch()
    }
    
    func scheduleRatesFetch() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [unowned self](_) in
            self.ratesFetchService.fetchRates(completion: { [unowned self](responseDTO) in
                if let rates = responseDTO.rates {
                    self.ratesManager.update(rates: rates)
                    self.amountsManager.addNewCurrencies(from: Array(rates.keys))
                    self.amountsManager.update(baseCurrency: self.dataProvider.lastEditedCurrencyCode)
                    self.dataProvider.update()
                }
            })
        }
    }

}
