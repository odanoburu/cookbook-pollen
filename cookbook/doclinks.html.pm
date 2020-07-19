#lang pollen

◊(define-meta files (("doclinks.rkt" "Source code for tag functions described here")
                     ("doclinks.css.pp" "CSS styles for Racket doc links")))

◊title{Automatic Racket documentation links}

If you’ve read any Racket documentation at all, you’ve seen how, in every block of example code,
every function name links directly to the documentation for that function. This is a feature of
◊link["https://docs.racket-lang.org/scribble/index.html"]{Scribble}, the Racket DSL for creating
documentation. Scribble exposes this capability so that we can take advantage of it in our programs
(including Pollen documents) as well.

You can read the source code in ◊repofile{doclinks.rkt}. Roughly, here is what it does when you use
the ◊tag{rkt} tag function:

◊ol{

◊li{It tries to find a ◊em{definition tag} for the given identifier, which contains information
about what module provides the documentation and what kind of thing it is. We pass it a list of
modules to search and call ◊rkt{xref-binding->definition-tag} for each one, stopping on the first
one that succeeds (using ◊rkt{for/or}).}

◊li{If we were able to find a definition tag, we can construct a URL from that, using ◊rkt{xref-tag->path+anchor}.}

}

◊strong{Note:} If the package containing the identifier your searching is installed in “user scope”
(the default for most people),
◊link["https://groups.google.com/g/racket-users/c/zIeAaJULzzI"]{you’ll get an error}. The only
workaround right now is to uninstall the package and reinstall it in “installation scope” with
◊code{raco pkg install --installation ◊i{pkg-name}}.

◊section{Quick aside: learning from the Racket documentation}

Ironically, if you wanted to learn how to do ◊em{just this} directly from the Racket documentation,
it wouldn’t be easy. The Racket docs often provide detailed technical information on individual
functions without providing examples of how those functions should be used together.◊tooltip{The
Pollen documentation is a welcome exception.}

When you find yourself in this situation — that is, when you’re pretty sure you’ve found the
documentation for the functions that do what you need but you’re not gettting the bigger picture —
the best thing to do is fire up DrRacket, ◊code{require} the modules in question, and try calling
the function(s) in question. See what results you get, and then try using the output from one as the
input for another. Looking at the outputs will often clarify things for you.
