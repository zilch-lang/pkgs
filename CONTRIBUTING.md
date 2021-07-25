# Contributing to this repository

## Getting started

- Please firstly read the [code of conduct](https://github.com/github/docs/blob/7f94058f57bc243a053f97b9965c05dbdfd01d21/CODE_OF_CONDUCT.md) to be sure to behave correctly
- Some issue templates are provided for convenience. Please use them when reporting anything. Contributors/members will remind you to follow a template if not already done.

## Commit message convention

Commit messages must ideally follow the `<package>: <short message>` convention, where `<package>` is the name of the package the commit is for and `<short message>` shortly (less than 80 characters) describes the changes operated.

Good messages include these:
- Package request: `<package>: init at <version>`
- Package upgrade: `<package>: <old-version> -> <new-version>`
- Package breakage: `<package>: mark broken`

For any other change, see any other commit related to it.

## Requesting a new package

This repository is a set of *user-contributed* packages.
This means that anybody can request its package to be added to the package set, in order for it to be used in any project.

For a package to be added here, it needs to follow these guidelines:
- it has to be a valid package, meaning it must contain all the necessary configuration files
- no obscene, harassing, discriminating or gore package name
- the package derivation needs to be written in the `packages` directory, organised depending on its main topic, hashed (see the `dhall hash` command) and added to the package set using this hash (`./my-new-package.dhall sha256:<derivation-hash>`); see the `Writing a derivation` section for more information

Requested packages will be manually verified to ensure they conform with these guidelines, and will be rejected if not.

Maintainers of the new package accept being pinged in case of breakage (see the next section).
Complaining about being pinged after adding a package will remove you from the maintainers of the package.

### Writing a derivation

This repository uses the [Dhall](https://dhall-lang.org) configuration language to describe the package set.
Writing a new derivation for your package is actually easy:
1. Fork this repository in order to add your new package.
2. Create a new file under the correct directory (e.g. `system/memory`) in the `packages` directory named `<package>/<version>.dhall` (like `system/memory/mmap/1.0.0.dhall`).
   Please make sure that the name of your new package is not already taken by another one!
3. The package structure is described in the [lib/package.dhall](./lib/package.dhall) file.
   Here is a quick recap of the available fields and their types:
   - `name : Text` represents a unique name for your package.
     It must be the same name than the file the derivation is contained in.
   - `version : Text` is the version of the package (please see this [semantic versioning guide](https://semver.org/) for this field).
   - `maintainers : List Text` indicates all the maintainers of the package (who can be pinged in case of problems with the package).
     This list must contain at least the github usernames of the maintainers, bu may additionally contain their emails (indicated between `<>` like `username <email>`).
   - `component : Optional Text` is an optional field that indicates, in case of a multi-component repository, which component to reference.
   - `src : Source` describes where to fetch the source from. For more information about the `Source` type, see [lib/source.dhall](./lib/source.dhall).
4. Commit and make a pull request following the "Request package" template.

## Package breakage and bug reports

Sometimes, packages break for a particular reason (it was written for an old version of the language, it was poorly written and still got merged, or any other reason).
When it happens, please ping at least one of the indicated maintainers (in the `maintainers` field) for them to be aware of the issue.
In case the `maintainers` field is empty, please refer to the commit log.

## Upgrading a package 

You reported a package breakage and the issue was fixed upstream, but unfortunately you cannot yet use it in your project.
In such case, you can request a package upgrade easily by updating the package's `version` and `source` fields, as well as the hash of the package in the package set.
