//
//  EmptySpaceWidgetView.swift
//  HomeScreenSpaces
//
//  Created by Aryan Chaubal on 8/3/20.
//

import SwiftUI
import WidgetKit

struct EmptySpaceWidgetView: View {
    var entry: EmptySpaceEntry
    var body: some View {
        if ImageLoader().getImage(with: entry.position) != nil {
            GeometryReader { geometry in
                
                Image(uiImage: ImageLoader().getImage(with: "\(entry.position)")!)
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }.widgetURL(URL(string: "homescreenspaces://clickwidget"))
            
        } else {
            VStack {
                Image("app_icon_widget")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(15)
                    .padding(.bottom, 5)
                Text("Open App to set up the widget.")
                    .minimumScaleFactor(0.8)
                    .multilineTextAlignment(.center)
            }.padding()
        }
    }
}

struct EmptySpaceWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        EmptySpaceWidgetView(entry: EmptySpaceEntry(date: Date(), position: "topLeft"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
