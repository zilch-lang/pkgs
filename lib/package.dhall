let Dependency = ./dependency.dhall

let Source = ./source.dhall

in  { Type =
        { -- | The name of the package
          name : Text
        , -- | The version, in semantic versioning form "X.Y.Z"
          version : Text
        , -- | A list of dependencies required by the package
          dependencies : List Dependency
        , -- | Where to fetch the source of the package from
          src : Source
        , -- | If multiple components are declared in the source, specify one
          component : Optional Text
        }
    , -- | * empty dependency list
      --   * no component
      default =
      { dependencies = [] : List Dependency, component = None Text }
    }
