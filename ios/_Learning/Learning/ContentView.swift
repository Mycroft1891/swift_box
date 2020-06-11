//
//  ContentView.swift
//  Xylophone
//
//  Created by Alexander on 2020/09/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 250)
            CircleImage(src: "tokyo")
                .offset(y: -100)
                .padding(.bottom, -100)
            VStack(alignment: .leading) {
                Text("Tokyo Tower")
                    .font(.title)
                HStack {
                    Text("Tokyo")
                        .font(.subheadline)
                    Spacer()
                    Text("(Japan)")
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
