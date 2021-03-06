    ;; Place your private configuration here! Remember, you do not need to run 'doom
    ;; sync' after modifying this file!

    ;; Some functionality uses this to identify you, e.g. GPG configuration, email
    ;; clients, file templates and snippets.
    (setq user-full-name "Hamza Shahid"
            user-mail-address "hamzashahid8000@gmail.com")

    ;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
    ;; are the three important ones:
    ;;
    ;; + `doom-font'
    ;; + `doom-variable-pitch-font'
    ;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
    ;;   presentations or streaming.
    ;;
    ;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
    ;; font string. You generally only need these two:
    ;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
    ;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

    ;; There are two ways to load a theme. Both assume the theme is installed and
    ;; available. You can either set `doom-theme' or manually load a theme with the
    ;; `load-theme' function. This is the default:
        (setq doom-theme 'doom-one)

    ;; If you use `org' and don't want your org files in the default location below,
    ;; change `org-directory'. It must be set before org loads!
        (setq org-directory "~/.org/")

    ;; This determines the style of line numbers in effect. If set to `nil', line
    ;; numbers are disabled. For relative line numbers, set this to `relative'.
    (setq display-line-numbers-type t)
    ;; Here are some additional functions/macros that could help you configure Doom:
    ;;
    ;; - `load!' for loading external *.el files relative to this one
    ;; - `use-package!' for configuring packages
    ;; - `after!' for running code after a package has loaded
    ;; - `add-load-path!' for adding directories to the `load-path', relative to
    ;;   this file. Emacs searches the `load-path' when you load packages with
    ;;   `require' or `use-package'.
    ;; - `map!' for binding new keys
    ;;
    ;; To get information about any of these functions/macros, move the cursor over
    ;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
    ;; This will open documentation for it, including demos of how they are used.
    ;;
    ;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
    ;; they are implemented.

        ;; Set everything to show up as UTF-8 by default, which supports unicodes
        (set-language-environment "UTF-8")
        (set-default-coding-systems 'utf-8)

        ;; Map SPC o w to open elfeed doesn't work in these
        ;; (global-set-key (kbd "SPC o w") 'elfeed)
        ;; (evil-leader/set-leader "<SPC>")
        ;; (evil-leader/set-key "z" 'elfeed)
        ;; (setq evil-leader/no-prefix-mode-rx '("magit-.*-mode" "gnus-.*-mode"))

        ;; Works when doing this because the former reads <SPC> as "S" "P" "C"
        ;; See this: https://stackoverflow.com/questions/33061926/emacs-evil-space-as-a-prefix-key-in-motion-state
        (define-key evil-motion-state-map " " nil)

        ;; Make overview mode the default, extra help: [[https://orgmode.org/manual/Initial-visibility.html#Initial-visibility][Inital Visibility]]
        (setq org-startup-folded t)
        ;; Enable org-bullets-mode by default in org-mode
        (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
        ;; Enable org-pretty-entities (\frac12 to 1/2, \dots) . See org-pretty-entities for the list of possible options
        (setq org-pretty-entities 1)
        ;; Hide the //, **, ~~, __, ... to format text in org-mode
        (setq org-hide-emphasis-markers 1)
        ;; Change the ... at the end of a headline/list that pops up when there is hidden content I added the space at the start for better spacing
        (setq org-ellipsis " ↴")
        ;; Make lists act like (basically) headlines, fold, overview, contents
        (setq org-cycle-include-plain-lists 'integrate)

        ;; look for the emoji folders here
        (setq emojify-emojis-dir "~/.doom.d/emojis")

        ;; Enable emojify-mode by default in text-mode and all other major modes
        (add-hook 'text-mode-hook (lambda () (emojify-mode)))
        (add-hook 'prog-mode-hook (lambda () (emojify-mode)))

        ;; Key binding to insert an emoji
        (define-key evil-motion-state-map (kbd "SPC i e") 'emojify-insert-emoji)

        ;; All of the feeds, but I am using elfeed-org, so it's there instead
        ;; (setq elfeed-feeds
        ;;       '(("https://lukesmith.xyz/rss.xml" blog)
        ;;         ("https://nation.com.pk/rss/karachi" news)
        ;;         ("http://joeroganexp.joerogan.libsynpro.com/rss" podcast)
        ;;         ("https://notrelated.libsyn.com/rss" podcast)
        ;;         "https://www.reddit.com/r/memes/.rss?format=xml" memes))

        (setq elfeed-db-directory "~/.elfeeddb")

        ;; Works when doing this because the former reads <SPC> as "S" "P" "C"
        ;; See this: https://stackoverflow.com/questions/33061926/emacs-evil-space-as-a-prefix-key-in-motion-state
        ;; if you ever want to remove this binding, just replace 'elfeed with nil
        (define-key evil-motion-state-map (kbd "SPC o w") 'elfeed)

        (elfeed-org)
        (setq rmh-elfeed-org-files (list "~/.doom.d/elfeed/elfeed.org"))
