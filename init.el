;; load package manager, add the Melpa package registry
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; load evil
(use-package evil
  :ensure t
  :config (evil-mode))

;; org mode
(use-package org
  :ensure t)
;; following three key bindings are recommended in org mode manual, section 1.3
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-store-agenda)
(global-set-key (kbd "C-c c") 'org-store-capture)
;; TODO workflow states
(setq org-todo-keywords
  '((sequence "TODO" "SOMEDAY" "|" "DONE")))


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
