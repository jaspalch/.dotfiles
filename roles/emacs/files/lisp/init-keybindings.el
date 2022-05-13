;; init-keybindings.el --- Keybindings

;;; Commentary:
;; Setup keybindings and related packages

;;; Code:

(require 'init-ui)
(require 'init-custom)

;; Keybindings
(use-package general
  :ensure t
  :config
  (general-define-key
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

	;; vterm
	"v" '(:ignore t :which-key "vterm")
	"v v" '(multi-vterm :which-key "multi-vterm")
	"v j" '(multi-vterm-next :which-key "multi-vterm next")
	"v k" '(multi-vterm-previous :which-key "multi-vterm previous")

	;; Search
	"F" '((deadgrep-kill-all-buffers):ignore t :which-key "Search")
	"F f" '( :which-key "find in file")

	;; Other
	"d" '(dired :which-key "dired")
	"p" '(projectile-command-map :which-key "projectile")
	"t" '(neotree-toggle :which-key "Toggle neotree")
	"g" '(magit :which-key "Open magit")
	"x" '(helm-M-x :which-key "Run helm-M-x")
	"SPC" '(helm-buffers-list :which-key "List buffers")
	"TAB" '(perspective-map :which-key "perspective")
	))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Which-key
(which-key-setup-side-window-bottom)

(provide 'init-keybindings)

;;; init-keybindings.el ends here
