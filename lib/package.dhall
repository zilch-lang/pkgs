let Source = ./source.dhall

in  { Type =
        { -- | The name of the package
          name : Text
        , -- | The version, in semantic versioning form "X.Y.Z"
          version : Text
        , -- | Where to fetch the source of the package from
          src : Source
        , -- | If multiple components are declared in the source, specify one
          component : Optional Text
        , -- | A list of maintainers
          maintainers : List Text
        }
    , default = { component = None Text, maintainers = [] : List Text }
    }
