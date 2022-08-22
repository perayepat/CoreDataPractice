//
//  CDataTutApp.swift
//  CDataTut
//
//  Created by Pat on 2022/08/22.
//

import SwiftUI

@main
struct CDataTutApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment( \.managedObjectContext, dataController.container.viewContext)
        }
    }
}
