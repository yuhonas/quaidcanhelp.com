# learntlist.com

[![Build Status](https://travis-ci.com/yuhonas/learntlist.com.svg?branch=master)](https://travis-ci.com/yuhonas/learntlist.com)

A dispassionate list of day to day learnings

## Why?

This is mostly a personal project that may have some wider appeal but for the last four years
I've kept a notebook of learnings in [evernote](https://evernote.com/features/webclipper) thing's I uttered thats interesting! and wished to revise at some point in the future, they're ingested into evernote in the following ways

1) Using the [evernote web clipper](https://evernote.com/features/webclipper) 
2) Adding a note that contains a short summary and a link to wikipedia (if an article resides there)

Lately I've been thinking

* How can I easily search/sort/view these learnings
* What's the ontology between all these items, what is the "bigger picture" 
* How could I present what i've learnt in a richer format
* How can I summarise/report on what i've learnt to reflect on it

Thankfully most of these are related to wikipedia articles from which I can derive structured content from, so... 

## Evernotes not the right fit, f*ck it, let's build something

First of all let's get the data out of evernote into something more usable, I dumped my entire notebok into the evernote [enml](https://dev.evernote.com/doc/articles/enml.php) format eg. `learnt-list.enex`, then I used [yq](https://github.com/kislyuk/yq) which has XML
support to transform it into JSON

1) Exporting notes I used the webclipper for

```bash
xq '.[] | .note | .[] | select(.["note-attributes"]["source-url"]| tostring | contains("wikipedia")) | { created, updated, title, attributes: .["note-attributes"] }' learnt-list.enex
```

2) Exporting notes I added by hand that _somewhere_ in the body contained a wikipedia link

```bash
xq '.[] | .note | [.[] | (.content |  capture("(?<source-url>https://en.wikipedia.org/wiki/[\\\w%]+)")) as $attributes | { created, updated, title, "attributes": $attributes }]' learnt-list.enex
```

In both cases you'll get something like 

```json
{
  "created": "20161015T205009Z",
  "updated": "20161015T205009Z",
  "title": "The Magical Number Seven",
  "attributes": {
    "latitude": "-37.8132",
    "longitude": "145.002",
    "altitude": "0",
    "source": "mobile.android",
    "source-url": "https://en.m.wikipedia.org/wiki/The_Magical_Number_Seven"",
    "reminder-order": "0"
  }
}
```

### Prerequisites

* Elixir 1.7.x

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `learntlist` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:learntlist, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/learntlist](https://hexdocs.pm/learntlist).


## Running the tests

```
mix test
```

### Linting

[credo](https://github.com/rrrene/credo) is used for linting/style checking and runs as as part of the `test` task see [mix.exs](./mix.exs)

If you wish to run it in isolation

```
mix credo
```

## Deployment

There is a CI/CD pipeline setup on `master` which deploys to heroku see [travis.yml](./travis.yml)

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).


## Acknowledgements

* [A template to make a good README](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
