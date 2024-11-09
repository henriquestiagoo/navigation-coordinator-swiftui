//
//  ArticlesView.swift
//  NavigationRouter
//
//  Created by Tiago Henriques on 07/11/2024.
//

import SwiftUI

struct ArticlesView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    let articles: [Article]

    var body: some View {
        List {
            ForEach(articles) { article in
                Text(article.title)
            }

            Section {
                Button {
                    routerManager.reset()
                } label: {
                    Text("Go back to Issues")
                }
            }
        }
        .navigationTitle("Articles")
    }
}

#Preview {
    NavigationStack {
        ArticlesView(
            articles: Article.articlesFromIssue20
        )
        .environmentObject(NavigationRouter())
    }
}
