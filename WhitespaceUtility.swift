//
//  WhitespaceUtility.swift
//  WhitespaceUtility
//
//  Created by Pavel Dolgov on 17-03-28.
//  Copyright © 2017 Pavel Dolgov. All rights reserved.
//

import Foundation

extension String {

    func sanitizeWhitespaces() -> String {
        var result = self

        // remove all leading spaces
        var idx = 0
        for character in result.characters where character != " " {
            idx += 1
        }
        result = result.substring(from: result.index(result.startIndex, offsetBy: idx))

        // remove all trailing spaces
        idx = 0
        for character in result.characters.reversed() where character != " " {
            idx += 1
        }
        result = result.substring(to: result.index(result.endIndex, offsetBy: -idx))

        // remove all multiple spaces between words
        if !result.characters.isEmpty {
            var idx2 = result.index(before: result.endIndex)
            var remove = false
            while idx2 > result.startIndex {
                if result[idx2] == " " {
                    if remove {
                        result.remove(at: idx2)
                    }
                    remove = true
                } else {
                    remove = false
                }
                idx2 = result.index(before: idx2)
            }
        }

        return result
    }

    func caseInsensitiveCompareUnderscoresGoFisrt(string: String) -> ComparisonResult {

        let numberOfLeadingUnderscoresInFirstString = countLeadingUnderscores()
        let numberOfLeadingUnderscoresInSecondString = string.countLeadingUnderscores()

        if numberOfLeadingUnderscoresInFirstString < numberOfLeadingUnderscoresInSecondString {
            return .orderedAscending
        }
        if numberOfLeadingUnderscoresInFirstString > numberOfLeadingUnderscoresInSecondString {
            return .orderedDescending
        }
        return caseInsensitiveCompare(string)
    }

    func countLeadingUnderscores() -> Index {
        for character in characters where character != "_" {
            return characters.index(of: character)!
        }
        return endIndex
    }
}
