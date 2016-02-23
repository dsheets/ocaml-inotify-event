(*
 * Copyright (c) 2016 David Sheets <david.sheets@docker.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *)

open Sexplib.Conv

open Inotify

let watch_of_sexp sexp = watch_of_int (int_of_sexp sexp)
let sexp_of_watch watch = sexp_of_int (int_of_watch watch)

type event_kind = Inotify.event_kind =
  | Access
  | Attrib
  | Close_write
  | Close_nowrite
  | Create
  | Delete
  | Delete_self
  | Modify
  | Move_self
  | Moved_from
  | Moved_to
  | Open
  | Ignored
  | Isdir
  | Q_overflow
  | Unmount
  [@@deriving sexp]

type t = watch * event_kind list * int32 * string option [@@deriving sexp]
