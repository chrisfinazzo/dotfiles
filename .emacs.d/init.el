;; Enable mouse support
(require 'mouse)
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; scroll one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; scroll smoothly

;; Set ispell-program-name to aspell
(setq ispell-program-name "aspell")

;; Set aspell parameters
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))

;; Enable flyspell-mode for text and programming modes
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;; For programming modes, only check comments
(dolist (hook '(emacs-lisp-mode-hook
                c-mode-hook
                python-mode-hook))
  (add-hook hook (lambda () (flyspell-prog-mode))))

;; Key bindings for spellcheck
(global-set-key (kbd "C-c i c") 'ispell-comments-and-strings)
(global-set-key (kbd "C-c i d") 'ispell-change-dictionary)
(global-set-key (kbd "C-c i f") 'flyspell-buffer)
(global-set-key (kbd "C-c i r") 'flyspell-region)
(global-set-key (kbd "C-c i b") 'ispell-buffer)
(global-set-key (kbd "C-c i w") 'ispell-word)

;; Disable autosave files
(setq auto-save-default nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(cua-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
