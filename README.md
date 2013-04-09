.emacs.d
========

For now, dependencies are git submodules.  Once you've cloned the repo, cd to .emacs.d and:

```
git submodule init
git submodule update
```

rinari has further subdependencies, so if you open emacs and get the error 'Cannot find jump', cd again to .emacs.d/vendor/rinari and

```
git submodule init
git submodule update
```
