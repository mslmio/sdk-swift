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

	/// Retrieves the app version from the app's Info.plist.
	var appVersion: String? {
		object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
	}

	/// Retrieves the app name from the app's Info.plist.
	var appName: String? {
		object(forInfoDictionaryKey: "CFBundleName") as? String
	}
}
