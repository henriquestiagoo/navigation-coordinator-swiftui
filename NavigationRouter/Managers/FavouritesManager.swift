//
//  FavouritesManager.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import Foundation

final class FavouritesManager: ObservableObject {
    @Published private(set) var issues: [Issue] = []

    public init(issues: [Issue] = []) {
        self.issues = issues
    }

    func add(_ item: Issue) {
        issues.append(item)
    }

    func remove(id: Int) {
        issues.removeAll(where: { $0.id == id })
    }

    func contains(_ issue: Issue) -> Bool {
        return issues.contains(where: { $0.id == issue.id })
    }
}
