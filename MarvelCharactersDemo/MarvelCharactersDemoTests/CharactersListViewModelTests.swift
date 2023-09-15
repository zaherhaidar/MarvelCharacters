//
//  CharactersListViewModelTests.swift
//  MarvelCharactersDemoTests
//
//  Created by zaher haidar on 15/09/2023.
//

import Combine
@testable import MarvelCharactersDemo
import XCTest

class CharactersListViewModelTests: XCTestCase {
    var sut: CharactersListViewModel!
    var marvelServiceMock: MarvelServiceMock!

    override func setUp() {
        super.setUp()
        marvelServiceMock = MarvelServiceMock()
        sut = CharactersListViewModel(marvelServiceType: marvelServiceMock)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFetchDataSuccess() {
        // Mock a successful response from the Marvel service
        
        sut.marvelServiceType.getCharacters(params: nil, withCache: false).sink { completion in
            if case .failure(_) = completion {
            }
        } receiveValue: { [weak self] response in
            self?.sut.characters = response.data?.results ?? []
            XCTAssertEqual(self?.sut.numberOfItems, 1)
        }.store(in: &sut.cancellables)
    
    }

}

