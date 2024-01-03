//
//  Bundle+Extensions.swift
//
//
//  Created by mslm on 22/12/2023.
//

import Foundation

extension Bundle {

	/// Retrieves the API key from the app's Info.plist.
	var apiKey: String? {
		object(forInfoDictionaryKey: "MslmApiKey") as? String
	}
}
