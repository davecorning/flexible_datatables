Change Log
==========

All notable changes to the project are documented in this file.

[v1.0.1] - 2015-02-15
--------------------

ca4badc Don't use 'blank?', which is an enhancement to Ruby from Rails, because obviously the code won't work outside of Rails
e621434 refer to the default DummyPaginator using the full namespace
4bb3085 Instantiate a Settings object when Configurator is defined, so default settings are available without needing to call Configurator.configuration first
513db65 pull in paginators and configurator definitions first
95d38a5 tweak file list
2308215 use rdoc for the README

[v1.0.0] - 2015-02-14
--------------------

38c6db1 initial commit

