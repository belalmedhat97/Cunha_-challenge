//
//  ContentView.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import SwiftUI

struct ContentView<VM>: View where VM:TickersViewModelProtocols {
    @StateObject var viewModel: VM
    @State private var tickerToSearch: String = ""

    var body: some View {
        VStack(spacing: 40) {
            SearchbarSubview(searchText: $tickerToSearch) {
                viewModel.getTickers(by: tickerToSearch)
            }
            GeometryReader { sectionGeo in
                ScrollView(.vertical){
                    VStack(spacing:20){
                        ForEach(viewModel.listOfTickers ?? [],id: \.self) { cells in
                            VStack(spacing:40) {
                                VStack(spacing:5) {
                                    Text("TICKER").foregroundColor(Color.white).padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12)).background(Color.black).cornerRadius(5)
                                    Divider().frame(height:3)
                                }
                                VStack(spacing:10){
                                    Text("Name: \(cells.name ?? "")")
                                    Text("Symbol: \(cells.symbol ?? "")")
                                    Text("Stock: \(cells.stock_exchange?.name ?? "")")
                                }.minimumScaleFactor(0.5).lineLimit(1)
                                
                            }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)).frame(height: sectionGeo.size.height/3).background(Color.white).cornerRadius(7).shadow(color: .gray, radius: 5, x: 0, y: 2)
                        }
                    }.padding(10)
                }
            }
        }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)).onAppear(){
            viewModel.service = ApiRequestsManager()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: TickersViewModel())
    }
}
