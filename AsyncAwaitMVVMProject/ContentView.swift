//
//  ContentView.swift
//  AsyncAwaitMVVMProject
//
//  Created by Efe Yencilek on 2021-10-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(Quote.dummyData, id: \.anime) { item in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "tv")
                            .font(.system(size: 12, weight: .black))
                        Text(item.anime)
                    }
                    if #available(iOS 15.0, *) {
                        Text(makeAttributedString(title: "Character", label: item.character))
                        Text(makeAttributedString(title: "Quotes", label: item.quote))
                            .lineLimit(2)
                    } else {
                        // Fallback on earlier versions
                        Text(item.character)
                        Text(item.quote)
                    }
                }
                .padding()
                .foregroundColor(.black)
            }
        }
    }
    
    @available(iOS 15, *)
    private func makeAttributedString(title: String, label: String) -> AttributedString {
        // Attributed text allows you to generate strings that have multiple font & size properties contained within
        var string = AttributedString("\(title): \(label)")
        string.foregroundColor = .black
        string.font = .system(size: 16, weight: .bold)
        
        if let range = string.range(of: label) {
            string[range].foregroundColor = .black.opacity(0.8)
            string[range].font = .system(size: 16, weight: .regular)
        }
        
        return string
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

