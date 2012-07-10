(require 'sml-mode)
(load "hol-mode.el")

(defun hol-execute ()
  (interactive)
  (let ((p1 nil)
        (p2 nil))
    (move-beginning-of-line nil)
    (setq p1 (point))
    (search-forward ";")
    (setq p2 (point))
    (copy-region-as-hol-definition p1 p2 1)
    )
)
  

(add-hook 'sml-mode-hook (lambda ()
			   (define-key sml-mode-map (kbd "M-e") 'hol-execute)
			   )
)

(provide 'guancio_hol)