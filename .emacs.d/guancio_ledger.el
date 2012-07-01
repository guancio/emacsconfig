(require 'ledger)

(defun ledger-report-stat ()
  (interactive)
  (ledger-report "stat" nil)
)

(setq auto-mode-alist
  (append 
   ;; File name (within directory) starts with a dot.
   '(("\\.led\\'" . ledger-mode))
   auto-mode-alist))



(setq ledger-reports
      (append 
       '(("stat" "ledger -f %(ledger-file) -s bal"))
       ledger-reports))

(define-key ledger-mode-map (kbd "M-b") 'ledger-report-stat)

(easy-menu-define ledger-menu ledger-mode-map "Ledger"
  '("Ledger"
    ["Stats" ledger-report-stat t]
))


(provide 'guancio_ledger)