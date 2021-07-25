let Snapshot = ../lib/snapshot.dhall

let Lib = ../lib.dhall

in  Snapshot::{
    , name = "lts-0.1"
    , -- NOTE: have you read the note in ../lib/snapshot.dhall?
      package-set = [] : List Lib.Package
    }
