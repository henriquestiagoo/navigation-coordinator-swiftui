//
//  Routes.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 11/11/2024.
//

import Foundation
import SwiftUI

enum AppRoutes: Routable {
    var id: UUID { UUID() }

    case articles(articles: [Article]) // article model needs to conform to Hashable.
    case favourites
    case issue(issue: Issue) // issue model needs to conform to Hashable.
    case root

    var body: some View {
        switch self {
        case .articles(let articles):
            ArticlesView(articles: articles)
        case .favourites:
            CoordinatorStack(root: FavouritesRoutes.root)
        case .issue(let issue):
            IssueView(issue: issue)
        case .root:
            AppView()
        }
    }
}

enum FavouritesRoutes: Routable {
    var id: UUID { UUID() }

    case root

    var body: some View {
        switch self {
        case .root:
            FavouritesView()
        }
    }
}
