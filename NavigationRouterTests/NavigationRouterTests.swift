//
//  NavigationRouterTests.swift
//  NavigationRouterTests
//
//  Created by Tiago Henriques on 07/11/2024.
//

import XCTest
@testable import NavigationRouter

final class NavigationRouterTests: XCTestCase {
    private var sut: NavigationRouter!

    override func setUp() {
        sut = NavigationRouter()
    }

    override func tearDown() {
        sut = nil
    }

    func test_routes_isEmpty_on_init() {
        XCTAssertEqual(sut.routes.count, 0, "There should be no routes in the navigation stack on init.")
    }

    func test_push_favorites_has_one_route() {
        sut.push(to: .favourites)
        XCTAssertEqual(sut.routes.count, 1, "There should be one route in the navigation stack.")
        XCTAssertEqual(sut.routes, [Route.favourites])
    }

    func test_push_two_screen_has_two_routes() {
        sut.push(to: .issue(issue: Issue.mocks.first!))
        sut.push(to: .articles(articles: Article.articlesFromIssue18))
        XCTAssertEqual(sut.routes.count, 2, "There should be two routes in the navigation stack.")
        XCTAssertEqual(sut.routes, [Route.issue(issue: Issue.mocks.first!), Route.articles(articles: Article.articlesFromIssue18)])
    }

    func test_navigate_back_has_one_route() {
        sut.push(to: .issue(issue: Issue.mocks.first!))
        sut.push(to: .articles(articles: Article.articlesFromIssue18))
        sut.navigateBack()
        XCTAssertEqual(sut.routes.count, 1, "There should be one route in the navigation stack.")
        XCTAssertEqual(sut.routes, [Route.issue(issue: Issue.mocks.first!)])
    }

    func test_reset_has_zero_routes() {
        sut.push(to: .issue(issue: Issue.mocks.first!))
        sut.push(to: .articles(articles: Article.articlesFromIssue18))
        sut.reset()
        XCTAssertEqual(sut.routes.count, 0, "There should be zero routes in the navigation stack.")
        XCTAssertEqual(sut.routes, [])
    }
}
