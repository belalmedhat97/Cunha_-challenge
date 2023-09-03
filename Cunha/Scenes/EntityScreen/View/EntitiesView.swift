//
//  ContentView.swift
//  Cunha
//
//  Created by belal medhat on 02/09/2023.
//

import SwiftUI

struct EntitiesView<VM>: View where VM:EntitesViewModelProtocols {
    @StateObject var viewModel: VM
    @State private var entityToSearch: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                SearchbarSubview(searchText: $entityToSearch) {
                    viewModel.getEntities(by: entityToSearch)
                }
                GeometryReader { sectionGeo in
                    ScrollView(.vertical) {
                        VStack(spacing:20) {
                            ForEach(viewModel.listOfEntites ?? [],id: \.self) { entity in
                                NavigationLink {
                                    EntityDetailsView(entityInfo:entity, viewModel: EntityDetailsViewModel())
                                } label: {
                                    VStack(spacing:40) {
                                        VStack(spacing:5) {
                                            Text(entity.name ?? "").foregroundColor(Color.white).padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12)).background(Color.black).cornerRadius(5).minimumScaleFactor(0.5).lineLimit(1)
                                            Divider().frame(height:3)
                                        }
                                        VStack(spacing:10){
//                                            Text("Name: \(entity.name ?? "")")
                                            Text("Symbol: \(entity.symbol ?? "")")
                                            Text("Stock: \(entity.stock_exchange?.name ?? "")")
                                        }.minimumScaleFactor(0.5).lineLimit(1)
                                        
                                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)).frame(height: sectionGeo.size.height/3).background(Color.white).cornerRadius(7).shadow(color: .gray, radius: 5, x: 0, y: 2)
                                }
                            }
                        }.padding(10)
                    }
                }
            }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)).onAppear(){
                viewModel.service = ApiRequestsManager()
            }
        }.alert(viewModel.error.txt, isPresented: $viewModel.error.show) {
            Button("OK", role: .cancel) {
                viewModel.error.show = false
                viewModel.error.txt = ""
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EntitiesView(viewModel: EntitesViewModel())
    }
}
