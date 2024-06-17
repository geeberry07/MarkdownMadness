//
//  ContentView.swift
//  MarkdownMadness
//
//  Created by Config Actor on 6/16/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        MarkdownTextView(markdown: "# Heading\n\nThis is a *Markdown* text.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
