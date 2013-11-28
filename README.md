# Introduction

A NSFormatter subclass that maps UIColor or NSColor instances to meaningful names

# Installation

Add the following to your [Podfile](http://docs.cocoapods.org/podfile.html):

    pod "KPAColorConvenience"

# Usage

Use like any other NSFormatter. `stringForObjectValue:` maps colors to names and `getObjectValue:forString:errorDescription:` does the reverse.
