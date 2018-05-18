;;; package --- Summary:

;;; Author --- Vikas Adiwal

;;; Commentary:

;;; Code:

(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

; initialize package.el
(package-initialize)

;;-------------------------------------------------------------------------------------------------------------------------------

;; Config for PUGOFER

(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))

;; Setups for emacs for using pugofer mode
;; Assumes you have pugofer.el on the load-path

(add-to-list 'load-path (expand-file-name "~/.emacs.d/setups"))
(autoload 'pugofer-mode "pugofer.el" nil t)
(autoload 'run-pugofer "pugofer.el" nil t)
(autoload 'pugofer-project "pugofer.el" nil t)
(setq pugofer-program-name (expand-file-name "~/gofer/src/gofer"))
(set-variable 'auto-mode-alist
      (append '(
	      ("\\.gs$" . pugofer-mode)   ;; gofer source
	      ("\\.lgs$" . pugofer-mode)   ;; literate gofer source
	      ("\\.gp$" . pugofer-project) ;; gofer project files
	      ) auto-mode-alist))


;; These should go into pugofer.el
;; For now you need to hand-change these paths

(defun run-pugofer-std ()
  (interactive)
  (setenv "PUGOFER" (expand-file-name "~/gofer/pustd.pre"))
  (run-pugofer pugofer-program-name))

(defun run-pugofer-simple ()
  (interactive)
  (setenv "PUGOFER" (expand-file-name "~/gofer/pusimple.pre"))
  (run-pugofer pugofer-program-name))

(defun run-pugofer-cc ()
  (interactive)
  (setenv "PUGOFER" (expand-file-name "~/gofer/pucc28.pre"))
  (run-pugofer pugofer-program-name))

;;-------------------------------------------------------------------------------------------------------------------------------

;save auto saves in seperate folder
(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist '(("." . "~/.emacs-saves/"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs-saves/" t)))


;;-------------------------------------------------------------------------------------------------------------------------------

;;(setq python-shell-interpreter "python3")

;;-------------------------------------------------------------------------------------------------------------------------------
(require 'company)                                   ; load company mode

;start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(flymake-cursor-mode 1)

(defun my:flymake-google-init () 
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/home/vikas/.local/bin/cpplint"))
  (flymake-google-cpplint-load)
)
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)
;;-------------------------------------------------------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("bea5fd3610ed135e6ecc35bf8a9c27277d50336455dbdd2969809f7d7c1f7d79" "a94f1a015878c5f00afab321e4fef124b2fc3b823c8ddd89d360d710fc2bddfc" "1c10e946f9a22b28613196e4c02b6508970e3b34660282ec92d9a1c293ee81bb" "68b847fac07094724e552eeaf96fa4c7e20824ed5f3f225cad871b8609d50ace" "ff8c6c2eb94e776c9eed9299a49e07e70e1b6a6f926dec429b99cf5d1ddca62a" "701b4b4e7989329a0704b92fc17e6600cc18f9df4f2466617ec91c932b5477eb" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "a02c000c95c43a57fe1ed57b172b314465bd11085faf6152d151385065e0e4b1" "d8a7a7d2cffbc55ec5efbeb5d14a5477f588ee18c5cddd7560918f9674032727" "2047464bf6781156ebdac9e38a17b97bd2594b39cfeaab561afffcbbe19314e2" "b6f06081b007b57be61b82fb53f27315e2cf38fa690be50d6d63d2b62a408636" "0ca71d3462db28ebdef0529995c2d0fdb90650c8e31631e92b9f02bd1bfc5f36" "fe349b21bb978bb1f1f2db05bc87b2c6d02f1a7fe3f27584cd7b6fbf8e53391a" "a11043406c7c4233bfd66498e83600f4109c83420714a2bd0cd131f81cbbacea" "780c67d3b58b524aa485a146ad9e837051918b722fd32fd1b7e50ec36d413e70" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c620ce43a0b430dcc1b06850e0a84df4ae5141d698d71e17de85e7494377fd81" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" default)))
 '(fci-rule-color "#393939")
 '(flymake-google-cpplint-command "/home/vikas/.local/bin/cpplint")
 '(package-selected-packages
   (quote
    (web-beautify async dash-functional helm-core helm-make helm-mode-manager helm-themes levenshtein projectile tern rtags cmake-ide helm company-tern xref-js2 kotlin-mode w3m py-autopep8 highlight-current-line elpygen tagedit ac-html ac-html-angular ac-php ac-php-core company-web haskell-mode php-mode powerline web-completion-data web-mode-edit-element xcscope company-statistics ac-html-csswatcher ac-html-bootstrap desktop+ sublimity google-c-style flymake-cursor flymake-cppcheck dracula-theme afternoon-theme ahungry-theme airline-themes ample-theme ample-zen-theme anti-zenburn-theme color-theme color-theme-actress color-theme-approximate color-theme-buffer-local color-theme-cobalt color-theme-complexity color-theme-dg color-theme-dpaste color-theme-eclipse color-theme-emacs-revert-theme color-theme-github color-theme-gruber-darker color-theme-heroku color-theme-ir-black color-theme-library color-theme-modern color-theme-molokai color-theme-monokai color-theme-railscasts color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-solarized color-theme-tango color-theme-tangotango color-theme-twilight color-theme-vim-insert-mode color-theme-wombat color-theme-x color-theme-zenburn company-php switch-window undo-tree autopair nlinum flycheck-haskell find-file-in-project highlight-indentation ivy pyvenv elpy smex auto-complete dash epl es-lib f irony js2-mode multiple-cursors pkg-info popup pythonic s yasnippet flycheck flymake-easy flycheck-irony flymake-google-cpplint iedit web-mode anaconda-mode company atom-dark-theme atom-one-dark-theme auto-auto-indent js2-refactor java-snippets chess auto-yasnippet auto-complete-c-headers abyss-theme)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;-------------------------------------------------------------------------------------------------------------------------------

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)


(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
                           
;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)

;;-------------------------------------------------------------------------------------------------------------------------------


(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
;;-------------------------------------------------------------------------------------------------------------------------------

(require 'company-web-html)                          ; load company mode slim backend


;; (setq company-minimum-prefix-length 0)            ; WARNING, probably you will get perfomance issue if min len is 0!
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key
;;-------------------------------------------------------------------------------------------------------------------------------
;fix iedit bug
(define-key global-map (kbd "C-c ;") 'iedit-mode)
;;-------------------------------------------------------------------------------------------------------------------------------

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'helm-config)
;(global-set-key (kbd "M-x") 'helm-M-x) ;;better completion than smex
(global-set-key (kbd "C-x C-b") 'helm-buffers-list) ;;better buffer switch mechanism
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;;-------------------------------------------------------------------------------------------------------------------------------

; Enable elpy mode for python
(elpy-enable)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
; Fixing a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
; Fixing another key binding bug in iedit mode
(define-key global-map (kbd "C-c o") 'iedit-mode)

;for pep8 autocorrection
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;;-------------------------------------------------------------------------------------------------------------------------------
;syntax check for C
(global-flycheck-mode)
(setq-default flycheck-select-checker '(c/c++-cppcheck))
(setq-default flycheck-disabled-checkers '(c/c++-gcc))
;;-------------------------------------------------------------------------------------------------------------------------------
;autopair
(autopair-global-mode)

;;-------------------------------------------------------------------------------------------------------------------------------
;switch windows fast!
(global-set-key (kbd "C-M-z") 'switch-window)
;;-------------------------------------------------------------------------------------------------------------------------------
;install nlinum package for line numbers
(global-nlinum-mode)

;;-------------------------------------------------------------------------------------------------------------------------------
;parethesis magic
(setq show-paren-delay 0)
;(show-paren-mode 1)
(setq show-paren-style 'expression)
;;-------------------------------------------------------------------------------------------------------------------------------
;stylize the parethesis
(require 'paren)
(set-face-background 'show-paren-match "#4b779c")
(set-face-foreground 'show-paren-match "#fff")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)
;;-------------------------------------------------------------------------------------------------------------------------------

;highlight current line
(global-hl-line-mode +1)

;(require 'alpha)
;(global-set-key (kbd "C-M-)") 'transparency-increase)
;(global-set-key (kbd "C-M-(") 'transparency-decrease)

;;-------------------------------------------------------------------------------------------------------------------------------
;cutomize the mini buffer
(powerline-center-theme)
(setq powerline-default-separator 'wave)

;;-------------------------------------------------------------------------------------------------------------------------------
;save desktop session
(require 'desktop)
(setq desktop-path (list "~/.emacs_desktop"))
(desktop-save-mode 1)
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)

;;disable splash screen
(setq inhibit-startup-screen t)

;;-------------------------------------------------------------------------------------------------------------------------------
;suggestions for files
(ido-mode 1)
(setq ido-separator "\n")
;;-------------------------------------------------------------------------------------------------------------------------------
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(defun my-web-mode-hook1 ()
  "Hooks for Web mode."
  (setq web-mode-css-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook1)

(defun my-web-mode-hook2 ()
  "Hooks for Web mode."
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook2)

(defun my-web-mode-hook3 ()
  "Hooks for Web mode."
  (setq web-mode-extra-auto-pairs
      '(("erb"  . (("beg" "end")))
        ("php"  . (("beg" "end")
                   ("beg" "end")))
       ))
)
(add-hook 'web-mode-hook  'my-web-mode-hook3)

(defun my-web-mode-hook4 ()
  "Hooks for Web mode."
  (setq web-mode-enable-auto-pairing t)
)
(add-hook 'web-mode-hook  'my-web-mode-hook4)
(require 'company)                                   ; load company mode
(require 'company-web-html)                          ; load company mode slim backend

(defun my-web-mode-hook5 ()
  "Hooks for Web mode."
  (setq web-mode-enable-css-colorization t)
)
(add-hook 'web-mode-hook  'my-web-mode-hook5)

;; (setq company-minimum-prefix-length 0)            ; WARNING, probably you will get perfomance issue if min len is 0!
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key

(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))


(setq web-mode-ac-sources-alist
  '(("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
    ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
    ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))

(add-hook 'web-mode-before-auto-complete-hooks
          '(lambda ()
             (let ((web-mode-cur-language
                    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
                   (yas-activate-extra-mode 'php-mode)
                 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
                   (setq emmet-use-css-transform t)
                 (setq emmet-use-css-transform nil)))))
;;-------------------------------------------------------------------------------------------------------------------------------
