;; PACKAGES
;;--------------------------------------------------

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(color-theme
                      color-theme-solarized
                      starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-ruby
                      starter-kit-eshell
                      go-mode
                      clojure-mode
                      clojure-test-mode
                      clojurescript-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; ENVIRONMENT
;;--------------------------------------------------

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

;; dir to store all extra extensions
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq vendor-dir (concat dotfiles-dir "/vendor"))

;; add my vendor dir to load path
(add-to-list 'load-path vendor-dir)

;; CODING STYLES
;;--------------------------------------------------

;; smooth-scrolling stops that annoying jump when moving around
(require 'smooth-scrolling)

;; makes sexps flash when you eval them!
(require 'highlight)
(require 'eval-sexp-fu)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 160)

;; show line numbers
(when window-system (global-linum-mode t))

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; solarized
(when window-system
  (require 'color-theme)
  (eval-after-load 'color-theme
    (progn
      (require 'color-theme-solarized)
      (color-theme-solarized-light))))

;; KEYBINDINGS
;;--------------------------------------------------

(defun osxp ()
  (string= "darwin" system-type))

(when (and (osxp) window-system)
  ;; make option the super key on mac
  (setq mac-option-modifier 'super)
  ;; map meta to command key for mac
  (setq ns-command-modifier 'meta))

(global-set-key [f7] 'ns-toggle-fullscreen)

;; steve yegges's suggested keybindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
;;(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key [f5] 'call-last-kbd-macro)
