//
//  OpenInSafari.swift
//  GitHubGetter
//
//  Created by Sam Mendelson on 7/3/20.
//  Copyright © 2020 iamtheyammer. All rights reserved.
//

import SwiftUI
import Foundation

func OpenInSafari(urlString: String) {
    guard let url = URL(string: urlString) else { return }
    if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url)
    }
}
