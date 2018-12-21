;;; init.el

(defun my-org-config()
  (interactive)
  (require 'org)
  (org-babel-load-file "~/.emacs.d/config.org")
  (byte-compile-file "~/.emacs.d/config.el"))

(if (file-exists-p "~/.emacs.d/config.elc")
    (if (file-newer-than-file-p "~/.emacs.d/config.org" "~/.emacs.d/config.el")
	(my-org-config)
      (load "~/.emacs.d/config.el"))
  (my-org-config))
