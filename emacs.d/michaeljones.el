;; dir to store all extra extensions
(setq plugins-dir (concat dotfiles-dir "/plugins"))

;; yas snippet
(add-to-list 'load-path (concat plugins-dir "/yasnippet-0.6.1c"))
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory (concat plugins-dir "/yasnippet-0.6.1c/snippets"))

;; rvm.el
(add-to-list 'load-path (concat plugins-dir "/rvm.el"))
(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session

;; use inconsolata in a nice small font
(set-face-attribute 'default nil
                    :family "inconsolata"
                    :height 130)

;; textmate plugin
(add-to-list 'load-path  (concat plugins-dir "/textmate.el"))
(require 'textmate)
(textmate-mode)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)


