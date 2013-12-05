% SPDY : For a Faster Web
% Antoine Pietri
% 2013-12-06

# HTTP problems

## Uniplexing

* One request per connection
* HTTP/1.1 Pipelining: enforces a FIFO queue
* Browsers work-around: open other connections
* Keep-Alive: dedicated connections, waste resources
* A typical TCP handshake takes 3 times your ping
* TCP connections are wasted

## Client-initiated requests

* Even when the server *knows* a resource is ready, it still has to wait for
  the client to request it
* Let's refresh the page every few seconds!
* A server push basically needs long polling
* Extremely expensive for old servers, not event-based
* Websockets

## Compression

* Content isn't compressed by defaut
* *Seriously.*
* $ wget http://gconfs.fr && gzip -c index.html > index.html.gz

*  $ wc -c index.html.gz index.html \
    1721 index.html.gz \
    4049 index.html \

* Headers can't be compressed

## TCP

# SPDY saves the day!

## Introduction

* Protocol created by Google in 2009
* IETF uses this as a base to create HTTP 2.0
* Many features

## Multiplexing

* Many concurrent HTTP requests
* A single TCP connection to transport them all

## Compression

* Everything is compressed by default
* Headers too!
* Redundant headers removed

## SSL

* SSL should be the choice by default
* It's actually expensive, so less likely to be used for personnal websites
* Some solutions exist (DNSSEC/DANE) to avoid a third-party CA
* Yes, it's slower than plain data
* Don't argue with that :)

## SSL

* SPDY actually relies on an SSL extension, NPN
* Flexibility across protocols and versions
* Backward compatibility
* Tedious for Virtual Hosting though :(

## Pushing

* Design involves a long-lasting connection
* Response does not close the request
* Actually possible to "push" data
* Server Push / Server Hint

# Support

## Clients

* Firefox since version 12
* Chrome since version 11
* Opera since version 12.10
* Internet Explorer since version 11!

## Servers

* Apache: using mod\_spdy is nearly only a drag'n'drop installation
* Nginx: activated with an option at compilation
* node-spdy, uwsgi, erlang-spdy, Tomcat module...

## Questions?

* antoine.pietri1@gmail.com
* \#epita @ irc.rezosup.org
* Slides available soon on http://gconfs.fr/confs
