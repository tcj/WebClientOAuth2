# WebClientOAuth2
OAuth2 components for Squeak's WebClient, roughly ported from Zinc-SSO in 2019.

See [Zinc on GitHub](https://github.com/svenvc/zinc)

## History 

For my silly [heckaprompter](https://github.com/tcj/heckaprompter) project,
I wanted to use OAuth2 rather than writing my own authentication systems
(with all the complexity, security, and wheel-reinventing that would
involve, while on a homework deadline).

Over more than a few lunch breaks and late evenings, I managed to rip apart
Zinc-SSO and make work with Squeak's WebClient/WebServer instead of Zinc,
only because Zinc isn't (wasn't?) available in Squeak.

Whereever you can find WebClient or WebUtils in this code, that's where
changes were made:

```WCOAuth2Session>>#getUserData
WCOAuth2Session>>#handleTokenRefresh (unused, I think)
WCOAuth2Session>>#authenticationUrlWithState: 
...more...
```

Perhaps instead of WebUtils, I could have used Seaside's own JSON parsing. 
No matter.  It works.

## What's here

Here we have Seaside components to handle redirects.  We have Google
capabilities but no others ... I didn't adapt the other OAuth2 providers
from Zinc-SSO.

There is a prototypical class for reading secrets from a json file rather
than storing them as constants in your code.  Unused by this code.  Probably
not useful at all.

## Current Status

I tore some of this out of my heckaprompter project for release here. It was
long overdue.  It may or may not work for you at all.

## What's next

It might be nice to implement SSO login as a WATask subclass.  I haven't
been able to quite wrap my head around the control flow exhibited by the
"Panel" system in use here, such that I can wrap it into my own system using
`#call`/`#answer`.

## Apologies

There are not enough class comments.  Probably not enough method comments. 
Most comments probably come from the code that trace back to Zinc-SSO.

