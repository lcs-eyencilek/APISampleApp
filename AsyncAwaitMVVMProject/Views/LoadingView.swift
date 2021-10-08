//
//  LoadingView.swift
//  AsyncAwaitMVVMProject
//
//  Created by Efe Yencilek on 2021-10-08.
//

import SwiftUI

struct LoadingView: View {
    
    let text: String
    
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
            Text(text)
        }
    }
}
