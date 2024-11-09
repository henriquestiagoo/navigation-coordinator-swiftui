//
//  AppView.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import SwiftUI

struct AppView: View {
    @StateObject private var routerManager = NavigationRouter()
    @StateObject private var favouritesManager = FavouritesManager()

    var body: some View {
        NavigationStack(path: $routerManager.routes) {
            List {
                Section("Issues") {
                    ForEach(Issue.sortedMocks) { issue in
                        NavigationLink(
                            value: Route.issue(issue: issue)
                        ) {
                            IssueRowView(issue: issue)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        routerManager.push(to: .favourites)
                    } label: {
                        Image(systemName: "heart")
                            .symbolVariant(.fill)
                            .padding(4)
                    }
                }
            }
            .navigationTitle("☕ iOS Coffee Break")
            .navigationDestination(for: Route.self) { $0 }
        }
        .environmentObject(routerManager)
        .environmentObject(favouritesManager)
    }
}

struct IssueRowView: View {
    let issue: Issue

    var body: some View {
        VStack(alignment: .leading) {
            Text(issue.title)
                .font(.headline)
            Text("Issue #\(issue.number)")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    AppView()
}
