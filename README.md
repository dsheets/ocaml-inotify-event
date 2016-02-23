## inotify event tools

The `Inotify_event` module provides [sexplib] constructors and
destructors for the `Inotify.event` type in the [inotify] library.

Also installed is a command line tool, `inotify-events` that sends
inotify events of the current working directory to `stdout`. The events
that `inotify-events` receives can be configured with
`--events=EVENT_LIST` where `EVENT_LIST` is a comma-separated list of
some of:

 * access
 * attrib
 * close_write
 * close_nowrite
 * create
 * delete
 * delete_self
 * modify
 * move_self
 * moved_from
 * moved_to
 * open
 * dont_follow
 * mask_add
 * oneshot
 * onlydir
 * move
 * close
 * all

By default, all events are received and output. The format of the output
can be set with `--format=FORMAT` where `FORMAT` is one of `string` or
`sexp` which outputs a pretty-printed string or an S-expression
consumable with the `Inotify_event` module.

[sexplib]: https://github.com/janestreet/sexplib
[inotify]: https://github.com/whitequark/ocaml-inotify
