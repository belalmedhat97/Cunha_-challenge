//
//  EntityDetailsView.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import SwiftUI
import Charts

struct EntityDetailsView<VM>: View where VM:EntityDetailsViewModelProtocols {
    @State var entityInfo:EntityData?
    @ObservedObject var viewModel: VM

    var body: some View {
        VStack(spacing:10){
            VStack(spacing:5) {
                Text(entityInfo?.name ?? "").foregroundColor(Color.white).padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12)).background(Color.black).cornerRadius(5)
                Divider().frame(height:3)
            }
            VStack(spacing:30){
                VStack(spacing:10){
                    Text("Symbol: \(entityInfo?.symbol ?? "")")
                    Text("Stock: \(entityInfo?.stock_exchange?.name ?? "")")
//                    Text("last Close: \(viewModel.entityTimes?[0].close ?? 0.0)")
                }
                Divider().frame(height:3)
                Text("CHART").foregroundColor(Color.white).padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12)).background(Color.black).cornerRadius(5)
                Divider().frame(height:3)
                    Chart {
                        ForEach(viewModel.entityTimes ?? [],id: \.self) { entity in
                            LineMark(x: .value("Day", (entity.date?.toDate()) ?? Date(), unit: .day), y: .value("Close price", entity.close ?? 0.0))
                        }
                    }.padding(10).foregroundStyle(.orange)
            }
        }.onAppear(){
            viewModel.service = ApiRequestsManager()
            viewModel.getEntityDetailsWithIntervals(by: entityInfo?.symbol ?? "", from: "", to: "")
        }

    }
}

struct EntityDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        EntityDetailsView(viewModel: EntityDetailsViewModel())
    }
}
