//
//  QuotesScreen.swift
//  AsyncAwaitMVVMProject
//
//  Created by Efe Yencilek on 2021-10-07.
//

import SwiftUI

struct QuotesScreen: View {
    
    let item: Quote
    
    var body: some View {
        List {
            ForEach(Quote.dummyData, id: \.anime) { item in
                QuoteView(item: item)
            }
        }
    }
    
}


struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen(item: Quote.dummyData[0])
    }
}

