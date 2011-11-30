(defun cd-to-rolls ()
  "cd to '~/rolls/'"
  (interactive)
  (cd "~/rolls/"))
(global-set-key (kbd "C-c C-r") 'cd-to-rolls)

(defun cd-to-emacs ()
  "cd to '~/.emacs.d/'"
  (interactive)
  (cd "~/.emacs.d/"))
(global-set-key (kbd "C-c C-e") 'cd-to-emacs)

(defun grep-find-from-here (str)
  "grep-find from here"
  (interactive "sfind-grep: ")
  (grep-find (concat "find . -type f -exec grep -nH -e '" str "' {} +")))
(global-set-key (kbd "C-x C-g") 'grep-find-from-here)

(defun ack-from-here (str)
  "ack from here"
  (interactive "sack: ")
  (ack str))
(global-set-key (kbd "C-x C-a") 'ack-from-here)

;; ---------------------------------------------------------------------------


(defun my-open-emacs-notes ()
  "Opening `~/rolls/0/emacs.txt'."
  (interactive)
  (find-file "~/rolls/0/emacs.txt"))
(global-set-key (kbd "C-c C-o C-e") 'my-open-emacs-notes)

(defun my-open-code-notes ()
  "Opening `~/rolls/0/code.txt'."
  (interactive)
  (find-file "~/rolls/0/code.txt"))
(global-set-key (kbd "C-c C-o C-c") 'my-open-code-notes)

(defun my-open-notes ()
  "Opening `~/rolls/0/memos.txt'."
  (interactive)
  (find-file "~/rolls/0/memos.txt"))
(global-set-key (kbd "C-c C-o C-m") 'my-open-notes)

;; ---------------------------------------------------------------------------

(defun my-open-init_el ()
  "Opening `~/.emacs.d/init.el'."
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "C-c C-o C-i") 'my-open-init_el)

(defun my-open-bash_profile ()
  "Opening `~/.bash_profile'."
  (interactive)
  (find-file "~/.bash_profile"))
(global-set-key (kbd "C-c C-o C-b") 'my-open-bash_profile)

(defun my-open-pryrc ()
  "Opening `~/.pryrc'."
  (interactive)
  (find-file "~/.pryrc"))
(global-set-key (kbd "C-c C-o C-p") 'my-open-pryrc)
