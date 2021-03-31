//
//  ContentView.swift
//  Expandable List View
//
//  Copyright © MITLicense. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //1.
    @State var comments = [Comments]()
    
    var body: some View {
        NavigationView {
            List(comments) { comment in
                VStack(alignment: .leading) {
                    Text(comment.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(comment.email)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text(comment.body)
                        .font(.body)
                }
                
            }
            .onAppear() {
                apiCall().getUserComments { (comments) in
                    self.comments = comments
                }
            }.navigationBarTitle("List View")
        }
    }
}
