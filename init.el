;; == internals ==============================================================

;; -- directories ------------------------------------------------------------
(setq smm-emacs-init-file (or load-file-name buffer-file-name))
(setq smm-emacs-config-dir (file-name-directory smm-emacs-init-file))
;; -- end --------------------------------------------------------------------

;; -- load everything from smm-init-dir --------------------------------------
(setq smm-init-dir (expand-file-name "init.d" smm-emacs-config-dir))
(if (file-exists-p smm-init-dir)
    (dolist (file (directory-files smm-init-dir t "\\.el$"))
      (load file)))
;; -- end --------------------------------------------------------------------

;; -- disable stuff ----------------------------------------------------------
(setq make-backup-files nil)
(setq auto-save-default nil)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
;; -- end --------------------------------------------------------------------

;; -- rows and columns -------------------------------------------------------
(setq line-number-mode t)
(setq column-number-mode t)

(global-linum-mode t)
(setq linum-format "%4d ")

(setq-default fill-column 80)
(add-hook 'text-mode-hook 'longlines-mode)
;; -- end --------------------------------------------------------------------

;; -- whitespace -------------------------------------------------------------
(require 'whitespace)
(add-hook 'ruby-mode-hook 'whitespace-mode)
(add-hook 'js-mode-hook 'whitespace-mode)
;; -- end --------------------------------------------------------------------

;; -- shortcuts --------------------------------------------------------------
(global-set-key (kbd "M-l") 'goto-line)
;; -- end --------------------------------------------------------------------

;; -- coding -----------------------------------------------------------------
(setq tags-table-list
      '("/Users/sean/projects/qs-core/TAGS"))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . ruby-mode))
;; -- end --------------------------------------------------------------------

;; == third-party packages ===================================================

;; -- magit ------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/vendor/magit-1.0.0/")
(setq exec-path (append exec-path '("/usr/local/git/bin")))
(require 'magit)
(global-set-key (kbd "M-g M-m") 'magit-status)

;; http://readystate4.com/2011/02/22/emacs-changing-magits-default-diff-colors/
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))
;; -- end --------------------------------------------------------------------

;; -- full-ack ---------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/vendor/full-ack-0.2.2/")
(setq exec-path (append exec-path '("/usr/local/bin")))
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)
;; -- end --------------------------------------------------------------------

;; -- iy-go-to-char ----------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/vendor/iy-go-to-char/")
(require 'iy-go-to-char)
(global-set-key (kbd "M-n") 'iy-go-to-char)
(global-set-key (kbd "M-N") 'iy-go-to-char-backward)
;; -- end --------------------------------------------------------------------
