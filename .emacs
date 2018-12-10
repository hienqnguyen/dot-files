(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://melpa.org/packages/") t)

(package-initialize)

(menu-bar-mode -1)
(display-time-mode 1)
(setq visible-bell t)

(show-paren-mode 1)
(setq show-paren-style 'parenthesis)

(when (member "Menlo" (font-family-list))
  (add-to-list 'initial-frame-alist '(font . "Menlo"))
  (add-to-list 'default-frame-alist '(font . "Menlo")))

(when (window-system)
  (tool-bar-mode 0)               
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))
  (scroll-bar-mode -1))

;; Meta is Option 
;; (setq mac-option-modifier 'meta)
;; (setq mac-command-modifier 'super)

;; Command-Q is awful (too easy to hit) ... especially next to
;; the more benign key binding to close a window: Cmd-W
;; (bind-key "A-q" 'dont-kill-emacs)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smart-mode-line neotree all-the-icons-dired org-cliplink org-brain all-the-icons org-mind-map use-package))))

;; All backup to a singl dir
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; This is an Emacs package that creates graphviz directed graphs from
;; the headings of an org file
(use-package org-mind-map
  :init
  (require 'ox-org)
  :ensure t
  ;; Uncomment the below if 'ensure-system-packages` is installed
  ;;:ensure-system-package (gvgen . graphviz)
  :config
  (setq org-mind-map-engine "dot")       ; Default. Directed Graph
  ;; (setq org-mind-map-engine "neato")  ; Undirected Spring Graph
  ;; (setq org-mind-map-engine "twopi")  ; Radial Layout
  ;; (setq org-mind-map-engine "fdp")    ; Undirected Spring Force-Directed
  ;; (setq org-mind-map-engine "sfdp")   ; Multiscale version of fdp for the layout of large graphs
  ;; (setq org-mind-map-engine "twopi")  ; Radial layouts
  ;; (setq org-mind-map-engine "circo")  ; Circular Layout
  )

;; load spacemacs theme
(load-theme 'spacemacs-dark t)

;; load the spaceline modeline theme
(require 'spaceline-config)
(spaceline-emacs-theme)

;; all-the-icons-dired hook
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

;; neotree
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(setq neo-theme 'arrow)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 160 :family "Inconsolata")))))

(defun toggle-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
This command is convenient when reading novel, documentation."
  (interactive)
  (if (eq (cdr (window-margins)) nil)
      (set-window-margins nil 0 (- (window-body-width) fill-column))
    (set-window-margins nil 0 0)))
