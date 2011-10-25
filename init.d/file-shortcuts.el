(defun my-open-emacs-notes ()
  "Opening `~/rolls/0/emacs.txt'."
  (interactive)
  (find-file "~/rolls/0/emacs.txt"))
(global-set-key (kbd "M-g M-e") 'my-open-emacs-notes)

(defun my-open-init_el ()
  "Opening `~/.emacs.d/init.el'."
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "M-g M-i") 'my-open-init_el)

(defun my-open-bash_profile ()
  "Opening `~/.bash_profile'."
  (interactive)
  (find-file "~/.bash_profile"))
(global-set-key (kbd "M-g M-b") 'my-open-bash_profile)

(defun my-open-pass ()
  "Opening `~/rolls/0/memos.txt'."
  (interactive)
  (find-file "~/rolls/0/memos.txt"))
(global-set-key (kbd "M-g M-p") 'my-open-pass)
