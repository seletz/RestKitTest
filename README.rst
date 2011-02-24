===============================
Basic RestKit/CoreData Test App
===============================

:Author: Stefan Eletzhofer
:Date: 2011-02-24


Abstract
========

These are my notes on getting a basic `RestKit` iPhone app going, which
also uses CoreData as a cache on the iPhone.

Motivation
----------

For some upcoming projects, I need my iOS apps to work w/o network
connection, giving the user full access to the data.

Goals
-----

The goals of this test app are:

- Show how RestKit's ObjectMapper works, including relations

Non-Goals
---------

- no server code.  I'll use a fabricated JSON file.
- no delete/update

Project Setup
=============

This is basic boilerplate setup:

- create a new XCode project:

  - 'navigation based'
  - 'use CoreData for storage'

- Add RestKit as a git submodule::

    seletz@QuickBrett: RestKitTest $ mkdir Libraries
    seletz@QuickBrett: RestKitTest $ git submodule add https://github.com/twotoasters/RestKit.git Libraries/RestKit


Links
=====

**RestKit**
    - http://restkit.org/
    - https://github.com/twotoasters/RestKit

**Two Toasters**
    http://twotoasters.com/

..  vim: set ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:
