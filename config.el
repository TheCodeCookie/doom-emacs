;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Set everything to show up as UTF-8 by default, which supports unicodes
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Enable emojify-mode by default in text-mode and all other major modes
(add-hook 'text-mode-hook (lambda () (emojify-mode)))
(add-hook 'prog-mode-hook (lambda () (emojify-mode)))

;; Compile all source blocks in an org mode file with that path
(org-babel-load-file (expand-file-name "~/.doom.d/myconfig.org"))
