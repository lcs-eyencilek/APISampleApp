//
//  QuotesScreen.swift
//  AsyncAwaitMVVMProject
//
//  Created by Efe Yencilek on 2021-10-07.
//

import SwiftUI

struct QuotesScreen: View {
    
    @StateObject private var vm = QuotesViewModelImpl(
        service: QuotesServiceImpl()
    )
    
    let item: Quote
    
    var body: some View {
        if #available(iOS 15.0, *) {
            Group {
                if vm.quotes.isEmpty {
                    LoadingView(text: "Fetching Data")
                } else {
                    List {
                        ForEach(vm.quotes, id: \.anime) { item in
                            QuoteView(item: item)
                        }
                    }
                }
            }
            .task {
                // With task method, you make the view wait for the code inside the task block to be executed before appearing, or loading
                await vm.getRandomQuotes()
            }
        } else {
            // Fallback on earlier versions
            List {
                ForEach(Quote.dummyData, id: \.anime) { item in
                    QuoteView(item: item)
                }
            }
        }
    }
    
}


struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen(item: Quote.dummyData[0])
    }
}

