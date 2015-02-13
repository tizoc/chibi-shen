;; Copyright (c) 2012-2015 Bruno Deferrari.  All rights reserved.
;; BSD 3-Clause License: http://opensource.org/licenses/BSD-3-Clause

(define-library (shen)
  (import

   (rename (shen primitives)
     (kl:if               if)
     (kl:and              and)
     (kl:or               or)
     (kl:cond             cond)
     (kl:intern           intern)
     (kl:pos              pos)
     (kl:tlstr            tlstr)
     (kl:cn               cn)
     (kl:str              str)
     (kl:string?          string?)
     (kl:string->n        string->n)
     (kl:n->string        n->string)
     (kl:set              set)
     (kl:value            value)
     (kl:simple-error     simple-error)
     (kl:trap-error       trap-error)
     (kl:error-to-string  error-to-string)
     (kl:cons             cons)
     (kl:hd               hd)
     (kl:tl               tl)
     (kl:cons?            cons?)
     (kl:defun            defun)
     (kl:lambda           lambda)
     (kl:let              let)
     (kl:=                =)
     (kl:eval-kl          eval-kl)
     (kl:freeze           freeze)
     (kl:type             type)
     (kl:absvector        absvector)
     (kl:<-address        <-address)
     (kl:address->        address->)
     (kl:absvector?       absvector?)
     (kl:read-byte        read-byte)
     (kl:write-byte       write-byte)
     (kl:open             open)
     (kl:close            close)
     (kl:get-time         get-time)
     (kl:+                +)
     (kl:-                -)
     (kl:*                *)
     (kl:/                /)
     (kl:>                >)
     (kl:<                <)
     (kl:>=               >=)
     (kl:<=               <=)
     (kl:number?          number?))

   (shen overwrites-internal)

   (prefix (chibi) scm.)
   (prefix (chibi filesystem) scm.)
   (prefix (scheme file) scm.)
   (prefix (scheme eval) scm.)
   (prefix (srfi 69) scm.))

  (export shen.shen
          shen.load)

  (include "init.scm")

  ;; Avoid warning about shen.demod not being defined yet
  (begin (defun shen.demod (Val) Val))

  (include "compiled/toplevel.kl.scm")
  (include "compiled/core.kl.scm")
  (include "compiled/sys.kl.scm")
  (include "compiled/sequent.kl.scm")
  (include "compiled/yacc.kl.scm")
  (include "compiled/reader.kl.scm")
  (include "compiled/prolog.kl.scm")
  (include "compiled/track.kl.scm")
  (include "compiled/load.kl.scm")
  (include "compiled/writer.kl.scm")
  (include "compiled/macros.kl.scm")
  (include "compiled/declarations.kl.scm")
  (include "compiled/types.kl.scm")
  (include "compiled/t-star.kl.scm")

  (begin
    ;; TODO: don't use Shen's `load`, we want a custom loader not
    ;; meant for the REPL here.
    (defun shen.load (File)
      (load File))

    (cd "")))
