# Change Log

All notable changes to the project are documented in this file.

## [Unreleased][unreleased]

## [v1.0.1] - 2015-02-15

### Fixed
* Don't use 'blank?', which is an enhancement to Ruby from Rails, because obviously the code won't work outside of Rails
* refer to the default DummyPaginator using the full namespace
* Instantiate a Settings object when Configurator is defined, so default settings are available without needing to call Configurator.configuration first
* pull in paginators and configurator definitions first

## v1.0.0 - 2015-02-14

[unreleased]: https://github.com/davecorning/flexible_datatables/compare/v1.0.1...HEAD
[v1.0.1]: https://github.com/davecorning/flexible_datatables/compare/v1.0.0...v1.0.1
