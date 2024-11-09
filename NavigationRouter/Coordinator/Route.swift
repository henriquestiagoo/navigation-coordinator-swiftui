//
//  Route.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import Foundation
import SwiftUI

enum Route {
    case articles(articles: [Article])
    case favourites
    case issue(issue: Issue)
}

extension Route: Hashable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.articles(let lhs), .articles(let rhs)):
            return lhs == rhs
        case (.favourites, .favourites):
            return true
        case (.issue(let lhs), .issue(let rhs)):
            return lhs.id == rhs.id
        default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
}

extension Route: View {
    var body: some View {
        switch self {
        case .articles(let articles):
            ArticlesView(articles: articles)
        case .favourites:
            FavouritesView()
        case .issue(let issue):
            IssueView(issue: issue)
        }
    }
}
