//
//  SettingsView.swift
//  HomeScreenSpaces
//
//  Created by Aryan Chaubal on 8/7/20.
//

import SwiftUI
import Combine
import WidgetKit

struct SettingsView: View {
    
    @AppStorage("quitIfWidgetClicked") var quitIfWidgetClicked = false
    @Environment(\.presentationMode) var presentation
    @State private var shouldShowRefreshAlert = false
    @State private var selection = ["Blue", "Orange", "Blue Green", "Dark", "AMOLED"].firstIndex(of: UIApplication.shared.alternateIconName ?? "Blue") ?? 0
    let types = ["Blue", "Orange", "Blue Green", "Dark", "AMOLED"]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Widgets"), footer: Text("Your widgets should automatically update when you set a new wallpaper in the app. However, if your widgets are not updating, you can try pressing the button above.")) {
                    Toggle(isOn: $quitIfWidgetClicked, label: {
                        Text("Quit on Widget Tap")
                    })
                    Button("Refresh Widgets") {
                        WidgetCenter.shared.reloadAllTimelines()
                        Haptics.shared.playSuccess()
                        self.shouldShowRefreshAlert = true
                    }
                }
                Section(header: Text("App")) {
                    Picker(selection: $selection, label: Text("App Icon")) {
                        ForEach(0 ..< types.count) { i in
                            HStack {
                                Image(types[i])
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .cornerRadius(10)
                                Text(types[i])
                            }.tag(i)
                        }
                    }
                    .onChange(of: selection) { (newSelection) in
                        Haptics.shared.playSuccess()
                        AppIconService().changeAppIcon(to: AppIconService.AppIcon.init(rawValue: types[self.selection]) ?? .primary)
                    }
                }
                
                Section(header: Text("Other")) {
                    Button("Report Bug") {
                        Haptics.shared.playSelectionImpact()
                        UIApplication.shared.open(URL(string: "https://github.com/chaubss/Hidden-Widgets/issues/")!, options: [:], completionHandler: nil)
                    }
                    Button("Tip Me") {
                        Haptics.shared.playSelectionImpact()
                        UIApplication.shared.open(URL(string: "https://paypal.me/aryanchaubal/")!, options: [:], completionHandler: nil)
                    }
                }
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(trailing: Button("Done") {
                Haptics.shared.playSelectionImpact()
                self.presentation.wrappedValue.dismiss()
            })
            .alert(isPresented: $shouldShowRefreshAlert, content: {
                Alert(title: Text("Done"), message: Text("All your widgets have reloaded."), dismissButton: .default(Text("Ok")))
            })
        }
    }
}

struct TextIconView: View {
    var text: String
    var iconName: String
    var iconColor: Color = .primary
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.system(.body, design: .rounded))
                .foregroundColor(iconColor)
            Text(text)
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

