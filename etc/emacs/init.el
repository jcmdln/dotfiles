;;; init.el

;; Ensure config has been compiled and is not stale, otherwise rebuild
;; and compile the configuration.

(defun my-org-config()
  "Build and compile 'org-mode' config."
  (interactive)
  (require 'org)
  (org-babel-load-file "~/.emacs.d/config.org")
  (byte-compile-file "~/.emacs.d/config.el"))

(if (file-newer-than-file-p "~/.emacs.d/config.org" "~/.emacs.d/config.el")
    (my-org-config)
  (load "~/.emacs.d/config.el"))
