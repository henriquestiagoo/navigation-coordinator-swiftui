//
//  FavouritesView.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject private var favouritesManager: FavouritesManager
    @Environment(Coordinator<AppRoutes>.self) private var appCoordinator
    @Environment(Coordinator<FavouritesRoutes>.self) private var favouritesCoordinator

    var body: some View {
        List {
            if favouritesManager.issues.isEmpty {
                Text("You have no favourite issues")
            } else {
                ForEach(favouritesManager.issues) { issue in
                    Text(issue.title)
                        .swipeActions {
                            Button(role: .destructive) {
                                favouritesManager.remove(id: issue.id)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    appCoordinator.pop(.sheet)
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .symbolVariant(.fill)
                        .padding(4)
                }
            }
        }
        .navigationTitle("Favourites")
    }
}

#Preview("With Favourites") {
    NavigationStack {
        FavouritesView()
            .environmentObject(FavouritesManager(issues: Issue.mocks))
            .environment(Coordinator<FavouritesRoutes>())
            .environment(Coordinator<AppRoutes>())
    }
}

#Preview("Without favorites") {
    NavigationStack {
        FavouritesView()
            .environmentObject(FavouritesManager())
            .environment(Coordinator<FavouritesRoutes>())
            .environment(Coordinator<AppRoutes>())
    }
}
