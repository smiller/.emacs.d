;; -- magit ------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/vendor/magit-1.0.0/")
(setq exec-path (append exec-path '("/usr/local/git/bin")))
(require 'magit)
;; -- end --------------------------------------------------------------------

;; -- full-ack ---------------------------------------------------------------
(setq exec-path (append exec-path '("/usr/local/bin")))
(add-to-list 'load-path "~/.emacs.d/vendor/full-ack-0.2.2/")
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)
;; -- end --------------------------------------------------------------------

;; -- rows and columns -------------------------------------------------------
(setq line-number-mode t)
(setq column-number-mode t)

(global-linum-mode t)
(setq linum-format "%4d ")

(setq-default fill-column 80)
(add-hook 'text-mode-hook 'longlines-mode)
;; -- end --------------------------------------------------------------------


;; -- tags -------------------------------------------------------------------
(setq tags-table-list
    '("/Users/sean/projects/qs-core/TAGS"))
;; -- end --------------------------------------------------------------------
