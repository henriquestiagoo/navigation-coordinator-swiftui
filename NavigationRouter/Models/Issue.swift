//
//  Issue.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import Foundation

struct Issue: Identifiable {
    var id: Int { number }
    let title: String
    let description: String
    let number: Int
    let image: String
    let date: Date
    let url: String
    let articles: [Article]
}

extension Issue {
    static let mocks: [Issue] = [
        .init(
            title: "👀 Reaching (almost) my personal goals for 2024! 🏋🏼‍♀️",
            description: "Earlier this year, I set several personal milestones, and as we enter the final quarter, I am happy to say that the only goal I haven't hit yet is going to the gym four times a week 😅🏋🏼‍♀️!",
            number: 18,
            image: "https://raw.githubusercontent.com/henriquestiagoo/ioscoffeebreak-ci/refs/heads/main/issues/18.png",
            date: Date.from(year: 2024, month: 10, day: 20),
            url: "https://www.ioscoffeebreak.com/issue/issue18",
            articles: Article.articlesFromIssue18
        ),
        .init(
            title: "🥷 Migrating workflows from TeamCity to Xcode Cloud ☁️",
            description: "Last week, I have been migrating our CI/CD pipelines from TeamCity to Xcode Cloud.",
            number: 19,
            image: "https://raw.githubusercontent.com/henriquestiagoo/ioscoffeebreak-ci/refs/heads/main/issues/19.png",
            date: Date.from(year: 2024, month: 10, day: 27),
            url: "https://www.ioscoffeebreak.com/issue/issue19",
            articles: Article.articlesFromIssue19
        ),
        .init(
            title: "🧑‍✈️ GitHub Copilot for Xcode is now available! ✈️",
            description: "This week, GitHub revealed that GitHub Copilot's code completion feature is now available in public preview for Xcode!",
            number: 20,
            image: "https://raw.githubusercontent.com/henriquestiagoo/ioscoffeebreak-ci/refs/heads/main/issues/20.png",
            date: Date.from(year: 2024, month: 11, day: 3),
            url: "https://www.ioscoffeebreak.com/issue/issue20",
            articles: Article.articlesFromIssue20
        )
    ]

    static let sortedMocks = mocks.sorted(by: { $0.date > $1.date })
}
