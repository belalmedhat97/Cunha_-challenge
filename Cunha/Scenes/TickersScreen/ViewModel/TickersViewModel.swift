//
//  TickersViewModel.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
@MainActor
protocol TickersViewModelProtocols: ObservableObject {
    var service: TickersRequestProtocol? {get set}
    var listOfTickers:[TickerData]? {get}
    var error:(show:Bool,txt:String) {get set}
    func getTickers(by: String)
}

class TickersViewModel: TickersViewModelProtocols {
    
    var service: TickersRequestProtocol?
    @Published var listOfTickers:[TickerData]?
    @Published var error:(show:Bool,txt:String) = (false, "")
    func getTickers(by: String) {
        Task {
            let tickerInfo = await service?.requestTickers(_:by)
            guard tickerInfo?.error == nil else {
                error.txt = tickerInfo?.error?.localizedDescription ?? ""
                error.show = true
            return
            }
            guard let tickerList = tickerInfo?.result?.data else {return}
            listOfTickers = tickerList

        }
    }
    
    
}
