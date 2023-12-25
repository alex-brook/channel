(define-module (my-tools)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system go)
  #:use-module (gnu packages golang)
  #:use-module ((guix licenses) #:prefix license:))

(define-public lazygit
  (package
    (name "lazygit")
    (version "0.40.2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                     (url "https://github.com/jesseduffield/lazygit")
                     (commit (string-append "v" version))))
                     (sha256
                       (base32
                         "049gdbhsaqdpj4bn0k4dbzvwaig40p5vhmnqvj09as3f0wl5cgn6"))))
    (build-system go-build-system)
    (arguments `(
      #:import-path "github.com/jesseduffield/lazygit"
      #:go ,go-1.20))
    (synopsis "simple terminal UI for git commands")
    (description "Rant time: You've heard it before, git is powerful, but what good is that power when everything is so damn hard to do? Interactive rebasing requires you to edit a goddamn TODO file in your editor? Are you kidding me? To stage part of a file you need to use a command line program to step through each hunk and if a hunk can't be split down any further but contains code you don't want to stage, you have to edit an arcane patch file by hand? Are you KIDDING me?! Sometimes you get asked to stash your changes when switching branches only to realise that after you switch and unstash that there weren't even any conflicts and it would have been fine to just checkout the branch directly? YOU HAVE GOT TO BE KIDDING ME! If you're a mere mortal like me and you're tired of hearing how powerful git is when in your daily life it's a powerful pain in your ass, lazygit might be for you.")
    (home-page "https://github.com/jesseduffield/lazygit")
    (license license:expat)))
