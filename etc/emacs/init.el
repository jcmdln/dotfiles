;;; init.el

(defun emacs-build-config()
  "Rebuild and compile configuration."
  (interactive)
  (require 'org)
  (org-babel-load-file
   (expand-file-name "config.org" user-emacs-directory)
   t))

(if (file-exists-p "config.el")
    (load-file "config.el")
  (emacs-build-config))
