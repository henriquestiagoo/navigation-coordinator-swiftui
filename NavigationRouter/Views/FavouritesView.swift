//
//  FavouritesView.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject private var favouritesManager: FavouritesManager

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
        .navigationTitle("Favourites")
    }
}

#Preview("With Favourites") {
    NavigationStack {
        FavouritesView()
            .environmentObject(FavouritesManager(issues: Issue.mocks))
    }
}

#Preview("Without favorites") {
    NavigationStack {
        FavouritesView()
            .environmentObject(FavouritesManager())
    }
}
