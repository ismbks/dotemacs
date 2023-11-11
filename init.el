;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Use GNU repositories whenever possible
(setq package-archive-priorities
      '(("gnu"    . 3)
	("nongnu" . 2)
	("melpa"  . 1)))

;; Simplest use-package declaration
(eval-when-compile
  (require 'use-package))

;; Make custom file temporary
(setq custom-file (make-temp-file "emacs-custom-"))

;; Themes
;; (use-package jetbrains-darcula-theme
;;   :ensure t
;;   :config (load-theme 'jetbrains-darcula t))

;; (use-package ef-themes
;;   :ensure t
;;   :config (load-theme 'ef-autumn :no-confirm))

;; (use-package modus-themes
;;   :ensure t
;;   :config (load-theme 'modus-vivendi-tinted :no-confirm))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold nil)
  (setq doom-themes-enable-italic nil)
  (load-theme 'doom-gruvbox t))

;; Fonts
(set-face-attribute 'default nil :font "Fantasque Sans Mono" :height 130)
(set-face-attribute 'variable-pitch nil :font "Fantasque Sans Mono")
(set-face-attribute 'variable-pitch nil :font "Iosevka Comfy Motion Duo")

;; Sensible default settings
(global-display-line-numbers-mode)
(column-number-mode)
(delete-selection-mode)
(recentf-mode)
(savehist-mode)
(save-place-mode)

;; Helpful package
(use-package helpful
  :ensure t
  :bind (("C-h f" . helpful-callable)
	 ("C-h v" . helpful-variable)
	 ("C-h k" . helpful-key)
	 ("C-h x" . helpful-command)
	 ("C-h F" . helpful-function)
	 ("C-c C-d" . helpful-at-point)))

;; Emacs completion framework
;; Almost no configuration is needed
(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

(use-package corfu
  :ensure t
  :init (global-corfu-mode)
  :custom (corfu-auto t))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
