===============================
Basic RestKit/CoreData Test App
===============================

:Author: Stefan Eletzhofer
:Date: 2011-02-24


Abstract
========

These are my notes on getting a basic `RestKit` iPhone app going, which
also uses CoreData as a cache on the iPhone.

What I'm trying to build
------------------------

I'm trying to build a basic no-frills project/task/todo application, it
seems fitting to me ;)

The iPhone app will have a CoreData backing store, and I'll therefore have
to model entities using XCode.  Oh well.

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

  - while the RestKit project is selected, check all Frameworks needed (all except Three20 and SBJSON)

  - Edit the target's build setting and

    - add RestKit as direct dependency in the 'General' tab

    - add Missing frameworks to the 'Linked Libraries' List in the 'General' tab::

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

Fake JSON data
==============

To get started with RestKit, I've created some fake JSON data in 'htdocs'::

    seletz@QuickBrett: RestKitTest $ tree htdocs/
    htdocs/
    |-- project
    |   |-- 1.json
    |   |-- 2.json
    |   `-- 3.json
    `-- projects.json

    1 directory, 4 files

This can be served using::

    seletz@QuickBrett: RestKitTest $ cd htdocs/
    seletz@QuickBrett: htdocs $ python -mSimpleHTTPServer
    Serving HTTP on 0.0.0.0 port 8000 ...

The projects.json (plural, see?) collection looks like::

    [
    { "id": 1,
      "name": "First Project"},
    { "id": 2,
      "name": "Second Project"},
    { "id": 3,
      "name": "Third Project"}
    ]

And each **project** (singular!) looks like::

    {
    "id": 1,
    "name": "First Project",
    "text": "Foobar frobnicates Whizbangs."
    }

That **should** be enough for now.

Project Model
=============

Code cleanup
------------

As we're going to use RestKit, we'll just remove the CoreData stack setup
from the XCode template.  I just cleared every reference to NSManagedObject
etc from the  AppDelegate and RootViewController.

CoreData model
--------------

As already mentioned above, I want a CoreData backing store.  So let's
model the entities. **note: atm we only have one entity**

.. image:: https://github.com/seletz/RestKitTest/raw/master/images/project-model-1.png


Project model class
-------------------
   
- create a new class, based on NSObject, called "Project".  I like to keep
  these in a 'Models' group in XCode.

- I've added properties, and synthesized them.  I'll also adopt the
  practice to prefix properties with an underscore, like so::

    @implementation ProjectModel

    @synthesize identifier = _identifier;
    @synthesize name = _name;
    @synthesize text = _text;

    @end


Links
=====

**RestKit**
    - http://restkit.org/
    - https://github.com/twotoasters/RestKit

**Two Toasters**
    http://twotoasters.com/

..  vim: set ft=rst tw=75 nocin nosi ai sw=4 ts=4 expandtab:
