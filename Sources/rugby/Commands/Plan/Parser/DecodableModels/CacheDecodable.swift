//
//  CacheDecodable.swift
//  
//
//  Created by Vyacheslav Khorkov on 24.04.2021.
//

struct CacheDecodable: Decodable {
    let arch: String?
    let sdk: SDK?
    let keepSources: Bool?
    let exclude: [String]?
    let hideMetrics: Bool?
    let ignoreCache: Bool?
    let skipParents: Bool?
    let verbose: Bool?
}

extension Cache {
    init(from decodable: CacheDecodable) {
        self.arch = decodable.arch
        self.sdk = decodable.sdk ?? .sim
        self.keepSources = decodable.keepSources ?? false
        self.exclude = decodable.exclude ?? []
        self.hideMetrics = decodable.hideMetrics ?? false
        self.ignoreCache = decodable.ignoreCache ?? false
        self.skipParents = decodable.skipParents ?? false
        self.verbose = decodable.verbose ?? false
    }
}
