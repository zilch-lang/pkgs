let Package = (./lib/package.dhall).Type

let Source = ./lib/source.dhall

let Dependency = ./lib/dependency.dhall

in  { Package, Source, Dependency }
