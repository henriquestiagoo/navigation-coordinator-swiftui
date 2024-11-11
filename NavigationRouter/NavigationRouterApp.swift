//
//  NavigationRouterApp.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import SwiftUI

@main
struct NavigationRouterApp: App {
    @State private var favouritesManager = FavouritesManager()

    var body: some Scene {
        WindowGroup {
            CoordinatorStack(root: AppRoutes.root)
                .environmentObject(favouritesManager)
        }
    }
}
