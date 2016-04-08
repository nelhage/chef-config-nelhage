# Changelog

## v1.4.0

* Use `poise-archive` to unpack static binary archives. This should work better
  on AIX and Solaris, as well as making it easier to add more archive formats in
  the future.

## v1.3.3

* [#3](https://github.com/poise/poise-languages/pull/3) Fix `static` binary
  installation on AIX and Solaris.
* Only run the candidate version check for `system` installs when we aren't
  passing in package_version.

## v1.3.2

* Handle static archive unpacking correctly when a single download is shared
  between two paths.

## v1.3.1

* Fix system package installs on OS X.

## v1.3.0

* `%{machine_label}` is available in URL template for static download.
* Automatically retry `remote_file` downloads to handle transient HTTP failures.
* All `*_shell_out` language command helpers use `poise_shell_out` to set `$HOME`
  and other environment variables by default.

## v1.2.0

* Support for installing development headers with SCL providers.
* Add `PoiseLanguages::Utils.shelljoin` for encoding command arrays with some
  bash metadata characters allowed.
* [#1](https://github.com/poise/poise-languages/pull/1) Fix typo in gemspec.

## v1.1.0

* Add helpers for installing from static archives.
* Improve auto-selection rules for system and SCL providers.
* Support SCL packages that depend on other SCL packages.
* Support Ruby 2.0 again.

## v1.0.0

* Initial release!
