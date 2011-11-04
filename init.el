;; == internals ==============================================================

;; -- load everything from dotfiles-init-dir ---------------------------------
(setq init-file (or load-file-name buffer-file-name))
(setq dotfiles-dir (file-name-directory init-file))
(setq dotfiles-init-dir (expand-file-name "init.d" dotfiles-dir))
(if (file-exists-p dotfiles-init-dir)
    (dolist (file (directory-files dotfiles-init-dir t "\\.el$"))
      (load file)))

;; -- disable stuff ----------------------------------------------------------
(setq make-backup-files nil)
(setq auto-save-default nil)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

;; -- rows and columns -------------------------------------------------------
(setq line-number-mode t)
(setq column-number-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'longlines-mode)

;; -- whitespace -------------------------------------------------------------
(require 'whitespace)
(add-hook 'ruby-mode-hook 'whitespace-mode)
(add-hook 'js-mode-hook 'whitespace-mode)

;; -- coding -----------------------------------------------------------------
(setq tags-table-list
      '("/Users/sean/projects/qs-core/TAGS"))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . ruby-mode))

;; -- custom key bindings ----------------------------------------------------
;; because ruby-mode overrides C-M-p / C-M-n defaults
(global-set-key (kbd "M-g M-[") 'backward-list)
(global-set-key (kbd "M-g M-]") 'forward-list)
;; quicker guillemets
(global-set-key (kbd "C-c o") (kbd "C-x 8 * <"))
(global-set-key (kbd "C-c c") (kbd "C-x 8 * >"))

;; == third-party packages ===================================================

(setq themes-dir (expand-file-name "themes" dotfiles-dir))
(add-to-list 'custom-theme-load-path themes-dir)

(setq vendor-dir (expand-file-name "vendor" dotfiles-dir))
(dolist (project (directory-files vendor-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'magit)
(setq exec-path (append exec-path '("/usr/local/git/bin")))
(global-set-key (kbd "M-g M-m") 'magit-status)
;; defaults conflict with window-numbering
(global-set-key (kbd "M-g 1") 'magit-show-level-1)
(global-set-key (kbd "M-g 2") 'magit-show-level-2)
(global-set-key (kbd "M-g 3") 'magit-show-level-3)
(global-set-key (kbd "M-g 4") 'magit-show-level-4)
;; http://readystate4.com/2011/02/22/emacs-changing-magits-default-diff-colors/
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)
(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'iy-go-to-char)
(global-set-key (kbd "M-n") 'iy-go-to-char)
(global-set-key (kbd "M-N") 'iy-go-to-char-backward)

(require 'inf-ruby)

(require 'unbound)

(require 'haml-mode)
(add-hook 'haml-mode-hook
                  '(lambda ()
                         (setq indent-tabs-mode nil)
                         (define-key haml-mode-map "\C-m" 'newline-and-indent)))

(require 'window-numbering)
(window-numbering-mode 1)
