;; init-ide.el --- IDE packages

;;; Commentary:
;; Configure packages that provide IDE features in Emacs

;;; Code:

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


(use-package deadgrep)

(provide 'init-ide)

;;; init-ide.el ends here
