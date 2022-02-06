//
//  FrameworkFolderPatcher.swift
//  Rugby
//
//  Created by Vyacheslav Khorkov on 06.02.2022.
//  Copyright © 2021 Vyacheslav Khorkov. All rights reserved.
//

import Files

struct FrameworkFolderPatcher {
    let config: String
    let sdk: String
    let arch: String

    private var configAndSdk: String { "\(config)-\(sdk)" }
    private var defaultPath: String { "\(String.buildsFolder)/\(configAndSdk)" }

    func prepareForBuild() throws {
        let defaultFolder = try? Folder.current.subfolder(at: defaultPath)
        try defaultFolder?.delete()

        let folderWithArch = try? Folder.current.subfolder(at: "\(defaultPath)-\(arch)")
        try folderWithArch.map { try $0.rename(to: configAndSdk) }
    }

    func prepareForIntegration() throws {
        if let defaultFolder = try? Folder.current.subfolder(at: defaultPath) {
            try defaultFolder.rename(to: "\(configAndSdk)-\(arch)")
        }
    }
}
