;; load package manager, add the Melpa package registry
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; editorconfig
(use-package editorconfig
  :ensure t
  :config (editorconfig-mode 1))

;; load evil
(use-package evil
  :ensure t
  :config (evil-mode))

;; spacemacs-theme
(use-package spacemacs-theme
  :ensure t
  :defer t)

;; which-key, which list available keys after a prefix
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; helm-descbinds: find key bindings
(use-package helm-descbinds
  :ensure t
  :config (helm-descbinds-mode))

;; go-mode
;; https://github.com/dominikh/go-mode.el
(use-package go-mode
  :ensure t)

;; tuareg for Ocaml
(use-package tuareg
  :ensure t)
;; Integration with the `dune` build system
(use-package dune
  :ensure t)

;; make sure environment variables in Emacs look the same as in user's shell
;; https://github.com/purcell/exec-path-from-shell
;; I need this package because of this issue: https://stackoverflow.com/questions/25934406/tuareg-mode-cant-find-ocaml
(use-package exec-path-from-shell
  :ensure t
  :config (when (memq window-system '(mac ns x)) (exec-path-from-shell-initialize)))

;; org mode
(use-package org
  :ensure t)
;; following three key bindings are recommended in org mode manual, section 1.3
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-store-agenda)
(global-set-key (kbd "C-c c") 'org-store-capture)
;; TODO workflow keywords 
(setq org-todo-keywords
      '((sequence "INBOX(i)" "TODO(t)" "DOING(o)" "WRITING(w)" "|" "DONE(d)" "SOMEDAY(s)"  "BLOCKED(b)")
	(sequence "LEARNING(2)" "|" "LEARNT(3)")))
;; TODO keyword colors
(setq org-todo-keyword-faces
      '(("INBOX" . "purple") ("DOING" . "yellow") ("LEARNING" . "yellow")
	("BLOCKED" . "red") ("SOMEDAY" . "cyan")))
;; default agenda files list
(setq org-agenda-files
      (directory-files-recursively "~/Dropbox/Notes" "\.org$"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages (quote (evil ## spacemacs-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; scroll bar
(scroll-bar-mode -1)  ; disable scroll bar

;; increase the M-x key binding sugestion display time to 10 seconds
;; default is 2 seconds
;; set it to nil if you don't want to see it
(setq suggest-key-bindings 10)

;; turn on visual line moe
(global-visual-line-mode t)

;; Set relative line number
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Toggle reverting buffer when the file changes
(global-auto-revert-mode t)
