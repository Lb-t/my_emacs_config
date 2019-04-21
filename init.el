;;; configure

;;; code:
(require 'package)
;;(add-to-list 'package-archives
;;         '("melpa" . "https://melpa.org/packages/") t)
(setq package-archives '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
                         ("melpa" . "https://elpa.emacs-china.org/melpa/")))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (use-package spacemacs-theme dracula-theme markdown-mode company-lsp lsp-ui cmake-ide cmake-mode cmake-project clang-format company-irony company-irony-c-headers counsel-gtags counsel-projectile disaster flycheck-color-mode-line irony evil imenu-list ivy ivy-explorer neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 
(use-package evil
  :ensure t
  :config
  (evil-mode))
  
(use-package treemacs
  :ensure t
  :bind
  ("C-c t"   . treemacs)
)

(use-package treemacs-evil
  :ensure t
  :after treemacs evil
  )
(use-package treemacs-projectile
  :ensure t
  :after treemacs projectile
  )

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit transpose-frame
  :ensure t)

(use-package imenu-list
  :ensure t
  :bind ("C-c l" . imenu-list-smart-toggle))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

;;(require 'ivy)
;;(ivy-mode 1)

;;(require 'cmake-ide)
;;(cmake-ide-setup)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :bind (
	 ("C-c d" . lsp-find-definition)
	 ("C-c r" . lsp-find-references)
         ("C-c f" . lsp-format-buffer)
	 )
 )

(add-hook 'c-mode-hook #'lsp)
(setq lsp-prefer-flymake nil)
(setq lsp-print-io t)

(use-package lsp-ui
 :ensure t
 :commands lsp-ui-mode)

(use-package company-lsp
 :ensure t
 :commands company-lsp)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'lsp-ui-mode-hook 'flycheck-mode)

(require 'lsp-ui-flycheck)
 (with-eval-after-load 'lsp-mode
   (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1))))

(use-package clang-format
  :ensure t
  :bind ("C-c c f" . clang-format-buffer))

;;(require 'clang-format)
;;(global-set-key (kbd "C-c f") 'clang-format-buffer)

(use-package magit
  :ensure t
  :bind (("C-c g s" . magit-status)
	 ("C-c g l" . magit-log-current)))

(use-package cmake-mode
  :ensure t
  )

(use-package winum
  :ensure t
  :config
  (winum-mode)
  )

(use-package smex
  :ensure t
  :bind
  ("C-c x" . smex)
  :config
  (smex-initialize)
)

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config
  (projectile-mode +1)
  )

(use-package ibuffer
  :ensure t
  :bind
  ("C-x C-b" .  ibuffer)
)
 
(load-theme 'spacemacs-dark t)
;;(set-fringe-mode '(0 . 0))
(scroll-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode)

;;;  
