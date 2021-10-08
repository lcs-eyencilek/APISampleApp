//
//  QuotesViewModel.swift
//  AsyncAwaitMVVMProject
//
//  Created by Efe Yencilek on 2021-10-07.
//

import Foundation

protocol QuotesViewModel: ObservableObject {
    @available(iOS 15.0.0, *)
    func getRandomQuotes() async
}

@MainActor
final class QuotesViewModelImpl: QuotesViewModel {
    @Published private(set) var quotes: [Quote] = []
    
    private let service: QuotesService
    
    init(service: QuotesService) {
        self.service = service
    }
    
    @available(iOS 15.0.0, *)
    func getRandomQuotes() async {
        do {
            // Service class is to provide the service from the endpoint (api). This one is to transfer that service data to the view.
            self.quotes = try await service.fetch()
        } catch {
            print(error)
        }
    }
}
