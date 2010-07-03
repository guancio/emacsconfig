;; Latex configurations

(load "whizzytex.el")
(load "auctex.el" nil t t)

(require 'auto-complete-spell)
(require 'auto-complete-yasnippet)

(defun my-latex-map ()
  (define-key LaTeX-mode-map (kbd "M-b") 'TeX-command-master)
  (define-key LaTeX-mode-map (kbd "M-e") 'TeX-next-error)
  (define-key LaTeX-mode-map (kbd "M-E") 'TeX-previous-error)
  (define-key LaTeX-mode-map (kbd "M-l") 'TeX-recenter-output-buffer)
  (define-key LaTeX-mode-map "\C-c`" nil)
  (define-key LaTeX-mode-map "\C-x`" nil)
)



(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-preprocess-buffer)
(add-hook 'LaTeX-mode-hook 'my-latex-map)
;; Le cose matematiche e bibtek la vediamo in futuro
;;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook (lambda ()
			     (flymake-mode 0)
			     (setq ac-sources
				   (append '(ac-source-yasnippet) '(ac-source-ispell)))
			     ;; (setq ac-auto-start 1)
			     ;; (auto-complete-mode t)
			     ;; (setq ac-dwim t)
			     )
)
(setq reftex-plug-into-AUCTeX t)



(defun flymake-get-tex-args (file-name)
    (list "pdflatex" (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

;; (defun flymake-get-tex-args (file-name)
;;   (list "chktex" (list "-q" "-v0" file-name)))

(provide 'guancio_latex)
