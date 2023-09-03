//
//  SearchSubview.swift
//  Cunha
//
//  Created by belal medhat on 03/09/2023.
//

import SwiftUI

struct SearchbarSubview: View {
    @Binding var searchText:String
    var onSearchButtonClicked: () -> Void
    var body: some View {
        VStack(spacing: 16){
            HStack(){
                TextField("search", text: $searchText, prompt: Text("Search"))
                Spacer(minLength: 20)
                Button {
                    onSearchButtonClicked()
                } label: {
                    Image(systemName: "magnifyingglass").resizable().frame(width: 21,height: 21,alignment: .center).foregroundStyle(.white)
                }.frame(width: 40,height: 40).background(Color.black).cornerRadius(10)
            }.padding(EdgeInsets(top: 0, leading:15 , bottom: 0, trailing: 15)).frame(height: 50)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 2))
        }
    }
}

struct SearchbarSubview_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarSubview(searchText: .constant(""), onSearchButtonClicked: {})
    }
}
