(autoload 'python-mode "python-mode.el" "Python mode." t)
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(require 'auto-complete-rope)
(require 'anything-ipython)


(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))
;; (setq ipython-command "/usr/bin/ipython")
;; (require 'ipython)


(add-hook 'python-mode-hook
	  (lambda () 
	    (define-key py-mode-map "\C-d" 'rope-goto-definition)
	    (define-key py-mode-map "\C-h" 'rope-show-doc)
	    ))
;; (setq ropemacs-enable-autoimport t)
;; TODO PYTHON MODE
;; TAB if selection sifht right
;; <SHIFT>TAB if selection sifht left

(add-hook 'python-mode-hook 'flyspell-prog-mode 1)

(defun py-exec-region ()
  "Pymacs exec region"
 (interactive)
 (let myword 
   (setq myword
         (if (and transient-mark-mode mark-active)
             (buffer-substring-no-properties (region-beginning) (region-end))
           (thing-at-point 'symbol)))
   (pymacs-exec myword)
   ))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )



(add-hook 'python-mode-hook
	  (lambda ()
	    (setq ac-sources
		  (append '(ac-source-yasnippet) '(ac-source-rope)))
	    )
	  )


(add-hook 'python-mode-hook
	  (lambda () 
	    (define-key py-mode-map "\C-d" 'rope-goto-definition)
	    (define-key py-mode-map "\C-h" 'rope-show-doc)
	    ;;(define-key py-mode-map "\C-l" 'ryan-python-tab)
	    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lentissimo;
;; Auto Syntax Error Hightlight
;; (when (load "flymake" t)
;;  (defun flymake-pyflakes-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;	       'flymake-create-temp-inplace))
;;       (local-file (file-relative-name
;;	    temp-file
;;	    (file-name-directory buffer-file-name))))
;;     (list "pyflakes" (list local-file))))
;;  (add-to-list 'flymake-allowed-file-name-masks
;;	   '("\\.py\\'" flymake-pyflakes-init)))
;; (add-hook 'find-file-hook 'flymake-find-file-hook)



(provide 'guancio_python)
