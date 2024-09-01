(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; Initialize package sources and basic setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure that use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Use-package for better package management
(eval-when-compile
  (require 'use-package))

;; Add custom theme directory to load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Load the citrusOcean theme
(load-theme 'citrusOcean t)

;; Transparency function
(defun set-frame-transparency (active inactive)
  "Set the transparency of the Emacs frame."
  (set-frame-parameter nil 'alpha (list active inactive)))
(set-frame-transparency 90 80)  ;; Adjust opacity here

;; Python Configuration
(use-package python-mode
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp)))  ; Enable LSP
  :config
  (setq lsp-pyright-auto-import-completions t))

;; JavaScript and Web Development Configuration
(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  :config
  (setq js2-basic-offset 2))

(use-package web-mode
  :ensure t
  :mode ("\\.html?\\'" "\\.ejs\\'")
  :config
  (setq web-mode-markup-indent-offset 2))

(use-package css-mode
  :ensure t
  :mode "\\.css\\'"
  :config
  (setq css-indent-offset 2))

(use-package impatient-mode
  :ensure t
  :commands (impatient-mode)
  :init
  (defun my-impatient-mode-setup ()
    (impatient-mode)
    (httpd-start))
  :hook (web-mode . my-impatient-mode-setup))

;; SML/NJ Configuration
(use-package sml-mode
  :ensure t
  :mode ("\\.sml\\'" . sml-mode)
  :config
  (setq sml-program-name "/usr/bin/sml"))

;; Assembly - NASM/FASM Configuration
(use-package nasm-mode
  :ensure t
  :mode ("\\.\\(asm\\|s\\)$" . nasm-mode))

;; C/C++ Programming Configuration
(use-package cc-mode
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (setq c-default-style "linux"
                    c-basic-offset 4))))

;; PowerShell Configuration
(use-package powershell
  :ensure t
  :mode ("\\.ps1\\'" . powershell-mode))

;; Bash Script Configuration
(setq-default sh-basic-offset 2
              sh-indentation 2)

;; UI and Usability Enhancements
(global-display-line-numbers-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Improve scrolling behavior
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

;; Save Emacs session history
(desktop-save-mode 1)

;; Start Emacs server if not already running
(require 'server)
(unless (server-running-p)
  (server-start))
