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

- Add RestKit to the Project:

  - Open the Libraies folder in finder
  - drag the `RestKit.xcodeproj` to the 'Groups & Files' pane in XCode
  - while the RestKit project is selected, check all Frameworks needed (all
    except Three20 and SBJSON)
  - Edit the target's build setting and
    - add RestKit as direct dependency in the 'General' tab
    - add Missing frameworks to the 'Linked Libraries' List in the
      'General' tab::

      CFNetwork.framework
      MobileCoreServices.framework
      SystemConfiguration.framework

    - Add to the 'Other Linker Flags'::

      -all_load
      -ObjC


   - Add to the 'Framework Search Paths' **and** 'Header Search Paths'::

      Libraries/RestKit/build

Now, add in the App Delegate::

  #import <RestKit/Restkit.h>

The Project schould build and run with no errors.


Links
=====

**RestKit**
    - http://restkit.org/
    - https://github.com/twotoasters/RestKit

**Two Toasters**
    http://twotoasters.com/

..  vim: set ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:
