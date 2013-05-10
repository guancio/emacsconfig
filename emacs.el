(defun on-kth-tcs20-p ()
  (string-equal system-name "tcs20.csc.kth.se")
)
(defun on-kth-omsk-p ()
  (string-equal system-name "omsk.csc.kth.se")
)
(defun on-chromebook-p ()
  (string-equal system-name "localhost"))
(defun on-guancio-studio-debian-p ()
  nil
)

(setq guancio-module-path "~/.emacs.d")

(if (on-kth-tcs20-p)
   (setq guancio-module-path "~/emacsconfig/emacs.d")
)
(if (on-kth-omsk-p)
   (setq guancio-module-path "~/emacsconfig/emacs.d")
)



(add-to-list 'load-path guancio-module-path)
(add-to-list 'load-path (format "%s/%s" guancio-module-path "modules"))
(add-to-list 'load-path (format "%s/modules/%s" guancio-module-path "popup-el"))
(add-to-list 'load-path (format "%s/modules/%s" guancio-module-path "auto-complete"))
(add-to-list 'load-path (format "%s/modules/%s" guancio-module-path "emacs-calfw"))
(add-to-list 'load-path (format "%s/modules/%s" guancio-module-path "sml-mode"))

(if (on-chromebook-p)
    (add-to-list 'load-path (format "%s/modules/%s" guancio-module-path "yasnippet"))
)
(if (on-kth-tcs20-p)
    (add-to-list 'load-path (format "%s/modules/%s" guancio-module-path "yasnippet"))
)
(if (on-kth-omsk-p)
    (progn
      (add-to-list 'load-path (format "%s/modules/%s" guancio-module-path "yasnippet"))
      (add-to-list 'load-path "/opt/hol4.k.7-src/tools")
  ))

(require 'guancio_custom)
(require 'guancio_global_key)
(require 'guancio_buffer)

(require 'guancio_search)
(require 'guancio_copy_paste)

(require 'guancio_clean_menu)
(require 'guancio_autocomplete)
(require 'guancio_spell)
(require 'guancio_yas)

(if (or (on-guancio-studio-debian-p)
	(on-kth-tcs20-p)
	(on-chromebook-p))
    (require 'guancio_latex)
)

;; ;; (if (on-guancio-studio-debian-p)
;; ;;     (require 'guancio_ledger)
;; ;; )

;; (require 'guancio_org)

;; (require 'guancio_sml)

;; (if (on-kth-omsk-p)
;;     (require 'guancio_hol)
;; )

;; (require 'guancio_sc)
