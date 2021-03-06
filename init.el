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
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode -1)

;; -- rows and columns -------------------------------------------------------
(setq line-number-mode t)
(setq column-number-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")
(setq-default fill-column 80)

;; -- look -------------------------------------------------------------------
(setq default-line-spacing 5)
(set-default-font "Georgia-18")
;; -- coding -----------------------------------------------------------------
(setq tags-table-list
  '("/Users/sean/projects/qs-core/TAGS"))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; -- custom key bindings ----------------------------------------------------
;; because ruby-mode overrides C-M-p / C-M-n defaults
(global-set-key (kbd "M-g M-[") 'backward-list)
(global-set-key (kbd "M-g M-]") 'forward-list)
;;
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key (kbd "C-c l") 'goto-line)

;; -- different modes --------------------------------------------------------
(defun my-text-mode-hook ()
  (typopunct-mode)
  (longlines-mode)
  (set-default-font "Georgia-18"))

(require 'whitespace)

(defun my-code-mode-hook ()
  (whitespace-mode)
  (typopunct-mode -1)
  (set-default-font "Menlo-16"))

(defun my-code-font-hook ()
  (typopunct-mode -1)
  (set-default-font "Menlo-16"))

(add-hook 'text-mode-hook 'my-text-mode-hook)

(add-hook 'ruby-mode-hook 'my-code-mode-hook)
(add-hook 'js-mode-hook 'my-code-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'my-code-mode-hook)
(add-hook 'markdown-mode-hook 'my-code-font-hook)

(defun turn-on-paredit () (paredit-mode 1))

(add-hook 'emacs-lisp-mode-hook 'turn-on-paredit)
(add-hook 'lisp-mode-hook 'turn-on-paredit)
(add-hook 'lisp-interaction-mode-hook 'turn-on-paredit)
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;; http://stackoverflow.com/a/7442266
;; handles unicode characters in prompt
(defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(setq ruby-deep-indent-paren nil)

;; == themes =================================================================
(setq themes-dir (expand-file-name "themes" dotfiles-dir))
(add-to-list 'custom-theme-load-path themes-dir)

(dolist (project (directory-files themes-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'custom-theme-load-path project)))

(load-theme 'zenburn t)

;; == third-party packages ===================================================
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

(require 'ido)
(ido-mode t)

(require 'rinari)

(require 'ruby-electric)
(ruby-electric-mode t)

(require 'clojure-mode)
(require 'paredit)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'typing)

(require 'typopunct)
(typopunct-change-language 'english t)
;; easy switch between French and English
(defun to-french()
  (interactive)
  (typopunct-change-language 'francais t))
(global-set-key (kbd "C-c C-l C-f") 'to-french)
(defun to-english()
  (interactive)
  (typopunct-change-language 'english t))
(global-set-key (kbd "C-c C-l C-e") 'to-english)

;; http://www.emacswiki.org/emacs/TypographicalPunctuationMarks
(defconst typopunct-ellipsis (decode-char 'ucs #x2026))
    (defun typopunct-insert-ellipsis-or-middot (arg)
      "Change three consecutive dots to a typographical ellipsis mark."
      (interactive "p")
      (cond
       ((and (= 1 arg)
             (eq (char-before) ?^))
        (delete-char -1)
        (insert typopunct-middot))
       ((and (= 1 arg)
             (eq this-command last-command)
             (looking-back "\\.\\."))
        (replace-match "")
        (insert typopunct-ellipsis))
       (t
        (self-insert-command arg))))
    (define-key typopunct-map "." 'typopunct-insert-ellipsis-or-middot)

(require 'rvm)
(rvm-use-default)

(require 'ruby-tools)

(require 'find-file-in-project)

;; from http://whattheemacsd.com/key-bindings.el-04.html
;; Function to create new functions that look for a specific pattern
(defun ffip-create-pattern-file-finder (&rest patterns)
  (lexical-let ((patterns patterns))
    (lambda ()
      (interactive)
      (let ((ffip-patterns patterns))
        (find-file-in-project)))))

;; Find file in project, with specific patterns

(global-set-key (kbd "C-c C-s rc")
                (ffip-create-pattern-file-finder "*_controller.rb"))

(global-set-key (kbd "C-c C-s rs")
                (ffip-create-pattern-file-finder "*_spec.rb"))

(global-set-key (kbd "C-c C-s sd")
                (ffip-create-pattern-file-finder "*_steps.rb"))


(global-set-key (kbd "C-c C-s rb")
                (ffip-create-pattern-file-finder "*.rb"))

(global-set-key (kbd "C-c C-s fe")
                (ffip-create-pattern-file-finder "*.feature"))

(global-set-key (kbd "C-c C-s ha")
                (ffip-create-pattern-file-finder "*.haml"))





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
