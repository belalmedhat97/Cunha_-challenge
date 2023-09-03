//
//  EntitesViewModel.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import Foundation
@MainActor
protocol EntitesViewModelProtocols: ObservableObject {
    var service: EntityRequestProtocol? {get set}
    var listOfEntites:[EntityData]? {get}
    var error:(show:Bool,txt:String) {get set}
    func getEntities(by: String)
}

class EntitesViewModel: EntitesViewModelProtocols {
    
    var service: EntityRequestProtocol?
    @Published var listOfEntites:[EntityData]?
    @Published var error:(show:Bool,txt:String) = (false, "")
    func getEntities(by: String) {
        Task {
            listOfEntites = []
            let entityInfo = await service?.requestEntity(by)
            guard entityInfo?.error == nil else {
                error.txt = entityInfo?.error?.localizedDescription ?? ""
                error.show = true
            return
            }
            guard entityInfo?.result?.data?.count != 0 else {
                error.txt = MainError.noDataFound.localizedDescription
                error.show = true
                return
            }
            guard let entitiesList = entityInfo?.result?.data else {return}
            listOfEntites = entitiesList

        }
    }
    
    
}
