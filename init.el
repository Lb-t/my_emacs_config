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
 
 
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key "f f" 'find-file)
  (evil-leader/set-key "b k" 'kill-buffer)
  (evil-leader/set-key "b n" 'evil-next-buffer)
  (evil-leader/set-key "b p" 'evil-prev-buffer)
  (evil-leader/set-key "b c" 'evil-buffer-new)
  (evil-leader/set-key "w d" 'delete-window)
  (evil-leader/set-key "w c" 'evil-window-new)
  (evil-leader/set-key "w p" 'evil-window-prev)
  (evil-leader/set-key "w n" 'evil-window-next)
  (evil-leader/set-key "w v" 'evil-window-vsplit)
  (evil-leader/set-key "w h" 'evil-window-left)
  (evil-leader/set-key "w j" 'evil-window-down)
  (evil-leader/set-key "w k" 'evil-window-up)
  (evil-leader/set-key "w l" 'evil-window-right)
   )

(use-package evil
  :ensure t
  :config
  (evil-mode))
 

(use-package treemacs
  :ensure t
  :bind
  ("C-c o t" . treemacs)
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

(use-package neotree
  :ensure t
  :init
  (evil-leader/set-key "f t" 'neotree-toggle)
  :config
  (add-hook 'neotree-mode-hook
        (lambda ()
          (define-key evil-normal-state-local-map (kbd "TAB")  'neotree-stretch-toggle)
          (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
          (define-key evil-normal-state-local-map (kbd "l") 'neotree-enter)
          (define-key evil-normal-state-local-map (kbd "h") 'neotree-select-up-node)
          (define-key evil-normal-state-local-map (kbd "|") 'neotree-enter-vertical-split)
          (define-key evil-normal-state-local-map (kbd "-") 'neotree-enter-horizontal-split)
          (define-key evil-normal-state-local-map (kbd "'") 'neotree-quick-look)
          (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
          (define-key evil-normal-state-local-map  (kbd "C") 'neotree-copy-node)
          (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)
          (define-key evil-normal-state-local-map (kbd "gr") 'neotree-refresh)
          (define-key evil-normal-state-local-map (kbd "H") 'neotree-select-previous-sibling-node)
          (define-key evil-normal-state-local-map (kbd "j") 'neotree-next-line)
          (define-key evil-normal-state-local-map (kbd "J") 'neotree-select-down-node)
          (define-key evil-normal-state-local-map (kbd "k") 'neotree-previous-line)
          (define-key evil-normal-state-local-map (kbd "K") 'neotree-select-up-node)
          (define-key evil-normal-state-local-map (kbd "L") 'neotree-select-next-sibling-node)
          (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
          (define-key evil-normal-state-local-map (kbd "r") 'neotree-rename-node)
          (define-key evil-normal-state-local-map (kbd "R") 'neotree-change-root)
          (define-key evil-normal-state-local-map (kbd "s") 'neotree-hidden-file-toggle)
        )
    )
 )

(use-package imenu-list
  :ensure t
  :init
  (evil-leader/set-key "l l" 'imenu-list-smart-toggle)
  )


;;(use-package counsel-projectile :ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)

)


(use-package counsel-gtags
  :ensure t
  :config
  (add-hook 'c-mode-hook 'counsel-gtags-mode)
  (add-hook 'c++-mode-hook 'counsel-gtags-mode)
  (with-eval-after-load 'counsel-gtags
  (define-key counsel-gtags-mode-map (kbd "C-c g d") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "C-c g r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "C-c g s") 'counsel-gtags-find-symbol)
  (define-key counsel-gtags-mode-map (kbd "C-c g b") 'counsel-gtags-go-backward)
  (define-key counsel-gtags-mode-map (kbd "C-c g f") 'counsel-gtags-go-forward)
  (define-key counsel-gtags-mode-map (kbd "C-c g c") 'counsel-gtags-create-tags)
  (define-key counsel-gtags-mode-map (kbd "C-c g u") 'counsel-gtags-update-tags)
  )
)


;;(require 'ivy)
;;(ivy-mode 1)

;;(require 'cmake-ide)
;;(cmake-ide-setup)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (evil-leader/set-key "l e" 'flycheck-next-error)
  )

(use-package yasnippet-snippets
  :ensure t
  )
(use-package lsp-mode
  :ensure t
  :commands lsp
  :init
  (evil-leader/set-key "l d" 'lsp-find-definition)
  (evil-leader/set-key "l r" 'lsp-find-references)
  (evil-leader/set-key "l f" 'lsp-format-buffer)
  (evil-leader/set-key "l F" 'lsp-format-region)
 )

(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode)))
(setq lsp-prefer-flymake nil)
(setq lsp-log-io t)

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
  :init
  (evil-leader/set-key-for-mode 'c-mode "b f" 'clang-format-buffer)
  :bind ("C-c c f" . clang-format-buffer))

;;(require 'clang-format)
;;(global-set-key (kbd "C-c f") 'clang-format-buffer)

(use-package magit
  :ensure t
  :init
  (evil-leader/set-key "g s" 'magit-status)
  (evil-leader/set-key "g l" 'magit-log-current)
  :bind (("C-c g s" . magit-status)
	 ("C-c g l" . magit-log-current)))

(use-package cmake-mode
  :ensure t
  )

(use-package ace-window
  :ensure t
  :init
  (evil-leader/set-key "w s" 'ace-window)
  )

(use-package smex
  :ensure t
  :bind
  :init
  (evil-leader/set-key "x" 'smex)
  :config
  (smex-initialize)
)

(use-package projectile
  :ensure t
  :init
  (evil-leader/set-key "p" 'projectile-command-map)
  :config
  (projectile-mode +1)
  )

(use-package ibuffer
  :ensure t
  :init
  (evil-leader/set-key "b s" 'ibuffer)
)

(use-package transpose-frame
  :ensure t
)

(use-package highlight-parentheses
  :ensure t
  :config
  (global-highlight-parentheses-mode))

(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl")
  (setq slime-contribs '(slime-fancy))
)

(use-package bing-dict
  :ensure t
  :init
  (evil-leader/set-key "s d" 'bing-dict-brief)
  )

(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

;;(set-fringe-mode '(0 . 0))
(scroll-bar-mode -1)
(tool-bar-mode -1)
;;(global-display-line-numbers-mode)
(menu-bar-mode -1)
(require 'electric)
(electric-pair-mode t)
(setq make-backup-files nil)
(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t)))
(setq backup-directory-alist
          `(("." . ,(concat user-emacs-directory "backups"))))

(setq-default buffer-file-coding-system 'utf-8-unix)

(add-to-list 'default-frame-alist
             '(font . "Source Code Variable 12"))
;;;
