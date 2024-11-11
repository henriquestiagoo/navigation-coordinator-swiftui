//
//  AppRoutesCoordinatorTests.swift
//  AppRoutesCoordinatorTests
//
//  Created by Tiago Henriques on 07/11/2024.
//

import XCTest
@testable import NavigationRouter

final class AppRoutesCoordinatorTests: XCTestCase {
    private var sut: Coordinator<AppRoutes>!

    override func setUp() {
        sut = Coordinator()
    }

    override func tearDown() {
        sut = nil
    }

    func test_routes_isEmpty_on_init() {
        XCTAssertEqual(sut.path.count, 0, "There should be no routes in the coordinator on init.")
        XCTAssertNil(sut.sheet, "There should be no sheet route in the coordinator.")
        XCTAssertNil(sut.fullscreenCover, "There should be no fullScreenCover route in the coordinator.")
    }

    func test_push_favorites_has_one_route() {
        sut.push(.favourites)
        XCTAssertEqual(sut.path.count, 1, "There should be one route in the coordinator.")
        XCTAssertNil(sut.sheet, "There should be no sheet route in the coordinator.")
        XCTAssertNil(sut.fullscreenCover, "There should be no fullScreenCover route in the coordinator.")
    }

    func test_sheet_favorites_has_one_route() {
        sut.push(.favourites, type: .sheet)
        XCTAssertEqual(sut.path.count, 0, "There should be no routes in the coordinator path.")
        XCTAssertEqual(sut.sheet, AppRoutes.favourites, "There should be an AppRoutes.favourites in the sheet route.")
        XCTAssertNil(sut.fullscreenCover, "There should be no fullScreenCover route in the coordinator.")
    }

    func test_push_two_screen_has_two_routes() {
        sut.push(.issue(issue: Issue.mocks.first!))
        sut.push(.articles(articles: Article.articlesFromIssue18))
        XCTAssertEqual(sut.path.count, 2, "There should be two routes in the coordinator path.")
        XCTAssertNil(sut.sheet, "There should be no sheet route in the coordinator.")
        XCTAssertNil(sut.fullscreenCover, "There should be no fullScreenCover route in the coordinator.")
    }

    func test_navigate_back_has_one_route() {
        sut.push(.issue(issue: Issue.mocks.first!))
        sut.push(.articles(articles: Article.articlesFromIssue18))
        XCTAssertEqual(sut.path.count, 2, "There should be two routes in the coordinator path.")
        sut.pop()
        XCTAssertEqual(sut.path.count, 1, "There should be one route in the coordinator path.")
        XCTAssertNil(sut.sheet, "There should be no sheet route in the coordinator.")
        XCTAssertNil(sut.fullscreenCover, "There should be no fullScreenCover route in the coordinator.")
    }

    func test_reset_has_zero_routes() {
        sut.push(.issue(issue: Issue.mocks.first!))
        sut.push(.articles(articles: Article.articlesFromIssue18))
        XCTAssertEqual(sut.path.count, 2, "There should be two routes in the coordinator path.")
        sut.reset()
        XCTAssertEqual(sut.path.count, 0, "There should be no routes in the coordinator path.")
        XCTAssertNil(sut.sheet, "There should be no sheet route in the coordinator.")
        XCTAssertNil(sut.fullscreenCover, "There should be no fullScreenCover route in the coordinator.")
    }
}
