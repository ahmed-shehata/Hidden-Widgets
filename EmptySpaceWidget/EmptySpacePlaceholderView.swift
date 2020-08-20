//
//  EmptySpacePlaceholderView.swift
//  HomeScreenSpaces
//
//  Created by Aryan Chaubal on 8/3/20.
//

import SwiftUI
import WidgetKit

struct EmptySpacePlaceholderView: View {
    var body: some View {
        VStack {
            Text("Placeholder")
                .font(.title)
                .bold()
                .foregroundColor(.accentColor)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            Text("If you see this for a long time, add your wallpaper again.")
                .minimumScaleFactor(0.5)
            Spacer()
        }.padding()
    }
}

struct EmptySpacePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        EmptySpacePlaceholderView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
