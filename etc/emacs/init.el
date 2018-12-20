;;; init.el

(require 'package)
(setq package-user-dir "~/.emacs.d/pkg/"
      package-archives
      '(("GNU ELPA"     . "http://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("GNU ELPA"     . 1)
        ("MELPA Stable" . 2)
        ("MELPA"        . 0)))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (require 'bind-key))

(setq use-package-always-defer      t
      use-package-always-ensure     t
      use-package-check-before-init t)


(require 'org)
(org-babel-load-file
 (expand-file-name
  "config.org" user-emacs-directory))

(if (file-exists-p (expand-file-name
		    "config.elc" user-emacs-directory))
    ()
  (byte-compile-file (expand-file-name
		    "config.el" user-emacs-directory)))
