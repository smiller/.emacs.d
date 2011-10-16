
;; -- magit ------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/vendor/magit-1.0.0/")
(setq exec-path (append exec-path '("/usr/local/git/bin")))
(require 'magit)
;; -- end --------------------------------------------------------------------

;; -- rows and columns -------------------------------------------------------
(setq line-number-mode t)
(setq column-number-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")
;; -- end --------------------------------------------------------------------


;; -- tags -------------------------------------------------------------------
(setq tags-table-list
    '("/Users/sean/projects/qs-core/TAGS"))
;; -- end --------------------------------------------------------------------
