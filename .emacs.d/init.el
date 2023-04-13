;; Enable mouse support
(require 'mouse)
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; scroll one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; scroll smoothly

;; Disable autosave files
(setq auto-save-default nil)
