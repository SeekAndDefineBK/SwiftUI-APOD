//
//  SettingView.swift
//  Apod-SwiftUI
//
//  Created by LiangYi on 2019/7/11.
//  Copyright © 2019 LiangYi. All rights reserved.
//

import SwiftUI

struct SettingView : View {
    
    @EnvironmentObject var setting: UserSetting
    @AppStorage("apiKey") var apiKey: String = "DEMO_KEY"
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        TextEditor(original: $apiKey)
                            .navigationTitle("Edit API Key")
                    } label: {
                        HStack {
                            Label("API Key", systemImage: "antenna.radiowaves.left.and.right")
                            Spacer()
                            Text(setting.apiKey)
                                .foregroundColor(.secondary)
                                .truncationMode(.tail)
                        }
                        
                    }
                    
                    Toggle(isOn: $setting.loadHdImage) {
                        Label("HD Image", systemImage: "map")
                    }
                }
                
                Section {
                    Button {
                        UIApplication.shared.open(URL(string: "https://github.com/LASER-Yi/SwiftUI-APOD")!, options: [:], completionHandler: nil)
                    } label: {
                        HStack {
                            Label("Github", systemImage: "heart")
                            Spacer()
                            Text("APOD-SwiftUI")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .accentColor(.primary)
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Settings"), displayMode: .inline)
        }
    }
}

#if DEBUG
struct SettingView_Previews : PreviewProvider {
    static var previews: some View {
        SettingView()
            .environmentObject(UserSetting.shared)
    }
}
#endif
