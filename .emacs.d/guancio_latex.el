;; Latex configurations
(require 'guancio_spell)
(require 'guancio_yas)

(load "auctex.el" nil t t)

;; (require 'auto-complete-yasnippet)

(defun my-latex-map ()
  (define-key LaTeX-mode-map (kbd "M-b") 'TeX-command-master)
  (define-key LaTeX-mode-map (kbd "M-e") 'TeX-next-error)
  (define-key LaTeX-mode-map (kbd "M-E") 'TeX-previous-error)
  (define-key LaTeX-mode-map (kbd "M-l") 'TeX-recenter-output-buffer)
  (define-key LaTeX-mode-map (kbd "M-p") 'preview-buffer)
  (define-key LaTeX-mode-map "\C-c`" nil)
  (define-key LaTeX-mode-map "\C-x`" nil)
)



(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; BUG: Non funziona. Non mi chiede il mater file
(setq-default TeX-master nil)

;; BUG: Non funziona con ecinve e continua a lanciarmi XPDF
(setq TeX-output-view-style
      (quote
       (("^pdf$" "." "evince -f %o")
        ("^html?$" "." "iceweasel %o"))))

(add-hook 'LaTeX-mode-hook (lambda ()
			     (setq ac-sources nil)
			     (auto-fill-mode)
			     (TeX-PDF-mode)
			     (my-latex-map)
			     (turn-on-reftex)
			     (yas/minor-mode-on)
			     (flyspell-mode t)
			     )
)
(setq reftex-plug-into-AUCTeX t)



;; TODO; Resize preview according with the zoom
;; TODO: Enable macro completition
;; TODO: Enable reference/bib completition
;; TODO: Enable whizzytex.el
;; TODO: Investigate Inverse search

;; (defun flymake-get-tex-args (file-name)
;;   (list "chktex" (list "-q" "-v0" file-name)))
			     ;; (flymake-mode 0)
			     ;; (setq ac-sources
			     ;; 	   (append '(ac-source-yasnippet) '(ac-source-ispell)))
;; (defun flymake-get-tex-args (file-name)
;;     (list "pdflatex" (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))



(provide 'guancio_latex)
