
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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



(setq python-shell-interpreter "python3")


