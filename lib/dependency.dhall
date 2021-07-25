{ -- | The name of the package dependency
  name : Text
, -- | A semantic version range.
  --   This accepts version constraints (such as @>=@, @>@, @==@, @<@ or @<=@)
  --   and combining them logically using @,@ (and) or @|@ (or).
  --
  --   Example: @">=1.0.0, <1.2.0"@
  version-range : Text
}
