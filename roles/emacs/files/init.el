;; Set encodings
(setq-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; Don't litter init file with custom settings
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Set package archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; PACKAGES

(use-package diminish
  :ensure t)

(use-package spacemacs-theme
  :ensure t
  :defer t)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(use-package org)

(defvar load-language-list '((emacs-lisp . t)
							   (python . t)
							   (js . t)
							   (java . t)
							   (go . t)
							   (shell . t)))

(use-package ob-go
    :init (cl-pushnew '(go . t) load-language-list))

(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :config
  ;;; Titles and Sections
  ;; hide #+TITLE:
  (setq org-hidden-keywords '(title))
  ;; set basic title font
  (set-face-attribute 'org-level-8 nil :family "Fira Sans" :weight 'light :inherit 'default)
  ;; Low levels are unimportant => no scaling
  (set-face-attribute 'org-level-7 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-6 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-5 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-4 nil :inherit 'org-level-8)
  ;; Top ones get scaled the same as in LaTeX (\large, \Large, \LARGE)
  (set-face-attribute 'org-level-3 nil :inherit 'org-level-8 :height 1.2) ;\large
  (set-face-attribute 'org-level-2 nil :inherit 'org-level-8 :height 1.44) ;\Large
  (set-face-attribute 'org-level-1 nil :inherit 'org-level-8 :height 1.728) ;\LARGE
  ;; Only use the first 4 styles and do not cycle.
  (setq org-cycle-level-faces nil)
  (setq org-n-level-faces 4)
  ;; Document Title, (\huge)
  (set-face-attribute 'org-document-title nil
					  :height 2.074
					  :foreground 'unspecified
					  :inherit 'org-level-8)
  ;; Babel
  (setq org-confirm-babel-evaluate nil)
  (org-babel-do-load-languages 'org-babel-load-languages load-language-list))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package magit
  :ensure t
  :custom (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :demand t
  :config
  (projectile-mode))

(use-package which-key
  :ensure t
  :defer t
  :diminish which-key-mode
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom))

(use-package helm
  :ensure t
  :demand t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'after-init-hook #'global-company-mode))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package vterm
    :ensure t)

;; BREAKS STUFF. modified files won't open in tramp
;;(use-package git-gutter
  ;;:ensure t
  ;;:config
  ;;(global-git-gutter-mode +1))

(use-package diff-hl
  :ensure t
  :config
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (global-diff-hl-mode))

(use-package go-mode
  :ensure t
  :config
  (add-hook 'go-mode-hook 'lsp-deferred))

(use-package neotree
  :ensure t)

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package exec-path-from-shell
  :ensure t
  :config
  (setq exec-path-from-shell-arguments '("-l"))
  (when (memq window-system '(mac ns x))
	(exec-path-from-shell-initialize)))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (custom-set-faces
	'(mode-line ((t (:family my-font-family :height 0.9))))
	'(mode-line-inactive ((t (:family my-font-family :height 0.9)))))
  (when (string-equal system-type "darwin")
  	(custom-set-faces
		'(mode-line ((t (:family my-font-family :height 1))))
		'(mode-line-inactive ((t (:family my-font-family :height 1)))))))

(use-package all-the-icons)

;; Colorful dired
(use-package diredfl
  :init (diredfl-global-mode 1))

(use-package all-the-icons-dired
    :diminish
    :hook (dired-mode . all-the-icons-dired-mode)
    :init (setq all-the-icons-dired-monochrome nil))

(use-package page-break-lines)

(use-package dashboard
  :config
  (setq dashboard-items '((recents  . 5)
                        (projects . 5)
                        (bookmarks . 5)
                        (agenda . 5)))

  (setq dashboard-center-content t)
  (setq dashboard-set-navigator t)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (dashboard-setup-startup-hook))

;; END PACKAGES

;; Random settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(global-auto-revert-mode t)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(setq-default tab-width 4)
;;(setq tramp-default-method "sshx")
;;(setq tramp-syntax 'simplified)
(set-face-attribute 'default nil :height 145)

 ;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Always follow symlinks
(setq vc-follow-symlinks t)

;; Set dir for backups
(setq backup-directory-alist `(("." . "~/.saves")))

;; Set theme
(load-theme 'doom-vibrant t)

;;Set font
(defvar my-font-family "Fira Code" "Font family to be used within Emacs.")
(defvar my-font-size "11" "Font size to be used within Emacs.")
(when (string-equal system-type "darwin" )
  (setq my-font-family "Menlo")
  (setq my-font-size "15"))

(set-frame-font (concat my-font-family " " my-font-size) nil t)

;; Random helpers
(defun my-open-init-file ()
  "Open the init file."
  (interactive)
  (find-file user-init-file))

;; Keybindings
(use-package general
  :ensure t
  :config
  (general-define-key
	;; :prefix leader
	:states '(normal insert emacs)
	:keymaps 'override
	:prefix "SPC"
	:non-normal-prefix "M-SPC"

	;; Files
	"f" '(:ignore t :which-key "Files")
	"f o" '(projectile-find-file :which-key "Find files")
	"f i" '(my-open-init-file :which-key "Open init.el")
	"f D" '(j/delete-file-and-buffer :which-key "Delete file and buffer")
	"f S" '(write-file :which-key "write-file")

	;; Buffers
	"b" '(:ignore t :which-key "Buffers")
	"b j" '(next-buffer :which-key "Next buffer")
	"b k" '(previous-buffer :which-key "Previous buffer")
	"b d" '(kill-current-buffer :which-key "Kill buffer")
	"w" '(save-buffer :which-key "Save buffer")

	;; Other
	"d" '(dired :which-key "dired")
	"p" '(projectile-command-map :which-key "projectile")
	"t" '(neotree-toggle :which-key "Toggle neotree")
	"g" '(magit :which-key "Open magit")
	"x" '(helm-M-x :which-key "Run helm-M-x")
	"SPC" '(helm-buffers-list :which-key "List buffers")
	))

 (which-key-setup-side-window-bottom)
