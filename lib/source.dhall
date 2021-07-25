< Git :
    { -- | The URL of the git repository
      url : Text
    , -- | The revision to pull the source code from (can be a branch name e.g. @master@ or a tag e.g. @v1.0.0@)
      rev : Text
    , -- | The checksum of the source tree
      sha256 : Text
    }
| Tar :
    { -- | Where to get the tarball from
      url : Text
    , -- | The checksum of the tarball file
      sha256 : Text
    }
>
