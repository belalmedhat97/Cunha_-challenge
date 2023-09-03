//
//  EntityDetailsViewModel.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
@MainActor
protocol EntityDetailsViewModelProtocols: ObservableObject {
    var service: EntityTimesRequestProtcols? {get set}
    var entityTimes:[EntityTimeData]? {get}
    var error:(show:Bool,txt:String) {get set}
    func getEntityDetailsWithIntervals(by: String, from: String, to: String)
}

class EntityDetailsViewModel: EntityDetailsViewModelProtocols {
    
    var service: EntityTimesRequestProtcols?
    @Published var entityTimes:[EntityTimeData]?
    @Published var error:(show:Bool,txt:String) = (false, "")
    
    func getEntityDetailsWithIntervals(by: String, from: String, to: String) {
        Task {
            let entityTimeIntervalsInfo = await service?.requestEntityBetweenIntervals(by, from: from, to: to)
            guard entityTimeIntervalsInfo?.error == nil else {
                error.txt = entityTimeIntervalsInfo?.error?.localizedDescription ?? ""
                error.show = true
            return
            }
            guard let timeIntervalsList = entityTimeIntervalsInfo?.result?.data else {return}
            entityTimes = timeIntervalsList

        }
    }
    
    
}
