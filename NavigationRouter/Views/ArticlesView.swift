//
//  ArticlesView.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import SwiftUI

struct ArticlesView: View {
    @Environment(Coordinator<AppRoutes>.self) private var appCoordinator
    let articles: [Article]

    var body: some View {
        List {
            ForEach(articles) { article in
                Text(article.title)
            }

            Section {
                Button {
                    appCoordinator.reset()
                } label: {
                    Text("Go back to Issues")
                }
            }
        }
        .navigationTitle("Articles")
    }
}

#Preview {
    CoordinatorStack(root: AppRoutes.articles(articles: Article.articlesFromIssue20))
        .environment(Coordinator<AppRoutes>())
}
