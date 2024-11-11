//
//  AppView.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import SwiftUI

struct AppView: View {
    @Environment(Coordinator<AppRoutes>.self) private var appCoordinator
    @EnvironmentObject private var favouritesManager: FavouritesManager

    var body: some View {
        List {
            Section("Issues") {
                ForEach(Issue.sortedMocks) { issue in
                    NavigationLink(
                        value: AppRoutes.issue(issue: issue)
                    ) {
                        IssueRowView(issue: issue)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    appCoordinator.push(.favourites, type: .sheet)
                } label: {
                    Image(systemName: "heart")
                        .symbolVariant(.fill)
                        .padding(4)
                }
            }
        }
        .navigationTitle("☕ iOS Coffee Break")
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
    CoordinatorStack(root: AppRoutes.root)
        .environment(Coordinator<AppRoutes>())
        .environmentObject(FavouritesManager())
}
