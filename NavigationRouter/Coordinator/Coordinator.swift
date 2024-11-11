//
//  Coordinator.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 11/11/2024.
//

import Foundation
import SwiftUI

@Observable
class Coordinator<Route: Routable> {

    var path: NavigationPath = NavigationPath()
    var sheet: Route?
    var fullscreenCover: Route?

    enum NavigationType {
        case push
        case sheet
        case fullScreenCover
    }

    enum NavigationPopType {
        case push(last: Int)
        case sheet
        case fullScreenCover
    }

    func push(_ page: Route, type: NavigationType = .push) {
        switch type {
        case .push:
            path.append(page)
        case .sheet:
            sheet = page
        case .fullScreenCover:
            fullscreenCover = page
        }
    }

    func pop(_ type: NavigationPopType = .push(last: 1)) {
        switch type {
        case .push(let last):
            path.removeLast(last)
        case .sheet:
            sheet = nil
        case .fullScreenCover:
            fullscreenCover = nil
        }
    }

    func reset() {
        path.removeLast(path.count)
    }
}
