//
//  Article.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import Foundation

struct Article: Hashable, Identifiable, Equatable {
    let id: Int
    let title: String
    let url: String
}

extension Article {
    static let articlesFromIssue18: [Article] = [
        .init(
            id: 0,
            title: "🏎 Working at startups vs large companies",
            url: "https://swiftrocks.com/working-at-startups-vs-large-companies"
        ),
        .init(
            id: 1,
            title: "⚠️ Why Do View Controllers Need init(coder:)?",
            url: "https://codingwithvera.com/why-do-uiviewcontrollers-need-init-coder/"
        ),
        .init(
            id: 2,
            title: "🧱 The perfect iOS networking layer does not exist - Part 2",
            url: "https://calincrist.com/the-perfect-ios-networking-layer-does-not-exist---part-2"
        )
    ]

    static let articlesFromIssue19: [Article] = [
        .init(
            id: 3,
            title: "🛠️ A Different Approach Using the Swift Argument Parser",
            url: "https://swifttoolkit.dev/posts/argument-parser-custom"
        ),
        .init(
            id: 4,
            title: "🕶 Improve your app's UX with SwiftUI's task view modifier",
            url: "https://peterfriese.dev/blog/2024/delay-task-modifier/"
        ),
        .init(
            id: 5,
            title: "🚫 Nitpicking during code review is just a waste of time. Invest in tooling instead",
            url: "https://medium.com/@SaezChristopher/nitpicking-during-code-review-is-just-a-waste-of-time-invest-in-tooling-instead-07ae29f4a56a"
        )
    ]

    static let articlesFromIssue20: [Article] = [
        .init(
            id: 6,
            title: "🧜‍♀️ The Strategy Pattern",
            url: "https://codingwithvera.com/the-strategy-pattern/"
        ),
        .init(
            id: 7,
            title: "🚣‍♂️ Coordinators & SwiftUI",
            url: "https://vbat.dev/coordinators-swiftui"
        ),
        .init(
            id: 8,
            title: "👶 Getting Started with Swift Package Manager",
            url: "https://swiftonserver.com/getting-started-with-swift-package-manager/"
        ),
        .init(
            id: 9,
            title: "💡 Blog about Swift: Tips and ideas to start your own",
            url: "https://www.avanderlee.com/swift/blog-about-swift/"
        )
    ]
}
