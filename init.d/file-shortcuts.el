(defun my-grep-find-in-rolls (str)
  "find-grep in '~/rolls/'"
  (interactive "sfind-grep in rolls: ")
  (cd "~/rolls/")
  (grep-find (concat "find . -type f -exec grep -nH -e '" str "' {} +")))
(global-set-key (kbd "C-c C-g C-r") 'my-grep-find-in-rolls)

(defun my-find-file-from-rolls ()
  "find-file starting at '~/rolls/'"
  (interactive)
  (cd "~/rolls/")
  (ido-find-file))
(global-set-key (kbd "C-c C-f C-r") 'my-find-file-from-rolls)

(defun my-dired-rolls ()
  "Opening '~/rolls'."
  (interactive)
  (dired "~/rolls/"))
(global-set-key (kbd "C-c C-d C-r") 'my-dired-rolls)

;; ---------------------------------------------------------------------------

(defun my-ack-in-qs-core (str)
  "ack in '~/projects/qs-core/'"
  (interactive "sack in qs-core: ")
  (cd "~/projects/qs-core")
  (ack str))
(global-set-key (kbd "C-c C-a C-q") 'my-ack-in-qs-core)

(defun my-find-file-from-qs-core ()
  "find-file starting at '~/projects/qs-core/'"
  (interactive)
  (cd "~/projects/qs-core/")
  (ido-find-file))
(global-set-key (kbd "C-c C-f C-q") 'my-find-file-from-qs-core)

(defun my-dired-qs-core ()
  "Opening '~/projects/qs-core'."
  (interactive)
  (dired "~/projects/qs-core/"))
(global-set-key (kbd "C-c C-d C-q") 'my-dired-qs-core)

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
