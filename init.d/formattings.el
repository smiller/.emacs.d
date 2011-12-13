(fset 'verse-line
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 67108896 134217837 23 5 32 32 60 98 114 47 62 1 down] 0 "%d")) arg)))
(global-set-key (kbd "C-c C-l C-v") 'verse-line)
