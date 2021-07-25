let Package = ./package.dhall

in  { Type =
        { -- | The name of the snapshot
          name : Text
        , -- | The list of packages to include in that snapshot
          --
          --   NOTE: Please hash all the packages (the .dhall files) using @dhall hash@ and reference them
          --         using @./some-file.dhall sha256:...@.
          package-set : List Package.Type
        }
    , default.package-set = [] : List Package.Type
    }
