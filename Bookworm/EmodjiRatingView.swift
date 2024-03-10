//
//  EmodjiRatingView.swift
//  Bookworm
//
//  Created by Margarita Mayer on 18/01/24.
//

import SwiftUI

struct EmodjiRatingView: View {
    let rating: Int
    
    var body: some View {
        switch rating {
        case 1:
            Text("☹️")
        case 2:
            Text("😒")
        case 3:
            Text("😐")
        case 4:
            Text("😊")
        case 5:
            Text("😍")
        default:
            Text("🤩")
            
        }
    }
}

#Preview {
    EmodjiRatingView(rating: 3)
}
