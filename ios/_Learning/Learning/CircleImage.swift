//
//  CircleImage.swift
//  Xylophone
//
//  Created by Alexander on 2020/09/30.
//

import SwiftUI

struct CircleImage: View {
    private var src: String
    
    init(src: String) {
        self.src = src
    }
    
    var body: some View {
        Image(self.src)
            .frame(width: 200, height: 200, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 40.0))
            .overlay(RoundedRectangle(cornerRadius: 40.0)
                        .stroke(Color.white, lineWidth: 5.0)
            )
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(src: "tokyo")
    }
}
