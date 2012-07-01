;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "evince %o %(outpage)") ("^html?$" "." "netscape %o"))))
;;  '(notmuch-saved-searches (quote (("DEletedToRemove" . "tag:deleted and (tag:inbox or tag:unread)") ("SpamToRemove" . "tag:spam and (tag:inbox or tag:unread)") ("InboxToSpam" . "subject:\"\\*spam\" and (not tag:spam) and (tag:inbox)") ("inbox" . "tag:inbox") ("unread" . "tag:unread"))))
;;  '(safe-local-variable-values (quote ((tex-master . "../main") (TeX-master . t))))


;; (require 'guancio_python)

(load "guancio_ediff.el")
(load "guancio_org.el")


;; Speedbar inside frame
;; (require 'sr-speedbar)





(add-to-list 'load-path "/usr/share/emacs/site-lisp/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
;; Non so perche' da errore
;; Develop in ~/emacs.d/mysnippets, but also
(setq yas/root-directory '("~/.emacs.d/mysnippets"
                           "/usr/share/emacs/site-lisp/yasnippet/snippets"))

;; Map `yas/load-directory' to every element
(mapc 'yas/load-directory yas/root-directory)

;; E' lento lo start up
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet/common/w3m")
;; (require 'w3m-load)
;; (require 'w3m)

(require 'flymake-extension)
(flymake-mode 0)

(require 'smart-compile)

(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; ;; clojure-mode
;; (add-to-list 'load-path "~/.emacs.d/clojure-mode")
;; (require 'clojure-mode)

;; ;; swank-clojure
;; (add-to-list 'load-path "~/.emacs.d/swank-clojure/src/emacs")

;; (setq swank-clojure-jar-path "/usr/share/clojure/clojure.jar"
;;       swank-clojure-extra-classpaths (cons
;; 				      "~/.emacs.d/swank-clojure/src/main/clojure"
;; 				      (directory-files "/usr/share/clojure/" t ".jar$"))
;;       )

;; (require 'swank-clojure-autoload)

;; ;; (setq inferior-lisp-program "/path/to/lisp-executable")
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
;; (require 'slime)
;; (slime-setup)



;; (load "haskell-mode/haskell-site-file.el")

;; (add-hook 'c-mode-hook          'flyspell-prog-mode 1)
;; (add-hook 'c++-mode-hook        'flyspell-prog-mode 1)
;; (add-hook 'sh-mode-hook         'flyspell-prog-mode 1)
;; (add-hook 'makefile-mode-hook   'flyspell-prog-mode 1)
;; (add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode 1)

(autoload 'ebib "ebib" "Ebib, a BibTeX database manager." t)
(require 'psvn)

(require 'recentf)
(recentf-mode t)

;; (require 'icicles)
;; (require 'lacarte)

(require 'filladapt)
(autoload 'sese-mode "sese" "Subtitle Editor major mode" t)


;; wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; IMAP
;; (setq elmo-imap4-default-server "imap.gmail.com")
;; (setq elmo-imap4-default-user "guancio@gmail.com") 
;; (setq elmo-imap4-default-authenticate-type 'clear) 
;; (setq elmo-imap4-default-port '993)
;; (setq elmo-imap4-default-stream-type 'ssl)
;; (setq elmo-imap4-use-modified-utf7 t) 
(setq elmo-maildir-folder-path "/media/data/Mail")


;; SMTP
;; (setq wl-smtp-connection-type 'starttls)
;; (setq wl-smtp-posting-port 587)
;; (setq wl-smtp-authenticate-type "plain")
;; (setq wl-smtp-posting-user "guancio")
;; (setq wl-smtp-posting-server "mail.netfarm.it")
;; (setq wl-local-domain "gmail.com")



(setq wl-default-folder ".INBOX")
;; (setq wl-default-spec "%")
(setq wl-draft-folder ".draft") ; Gmail IMAP
(setq wl-trash-folder ".trash")

(setq wl-stay-folder-window nil                       ;; show the folder pane (left)
      wl-folder-window-width 100                     ;; toggle on/off with 'i'
      wl-summary-use-frame t
      wl-draft-use-frame t
      )

(setq wl-folder-check-async t) 

(setq wl-smtp-posting-server "mail.netfarm.it"            ;; put the smtp server here
      wl-local-domain "netfarm.it"          ;; put something here...
      wl-message-id-domain "netfarm.it"     ;; ...
      wl-from "Roberto Guanciale <roberto@netfarm.it>"                  ;; my From:
      ;; note: all below are dirs (Maildirs) under elmo-maildir-folder-path 
      ;; the '.'-prefix is for marking them as maildirs
      wl-fcc ".sent"                       ;; sent msgs go to the "sent"-folder
      )
(setq wl-smtp-posting-port 25)

(setq wl-smtp-posting-server "localhost"            ;; put the smtp server here
      wl-local-domain "netfarm.it"          ;; put something here...
      wl-message-id-domain "netfarm.it"     ;; ...
      wl-from "Roberto Guanciale <roberto@netfarm.it>"                  ;; my From:
      ;; note: all below are dirs (Maildirs) under elmo-maildir-folder-path 
      ;; the '.'-prefix is for marking them as maildirs
      wl-fcc ".sent"                       ;; sent msgs go to the "sent"-folder
      )

(setq wl-smtp-posting-port 25000)


;; (setq wl-smtp-connection-type 'starttls)
;; (setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "guancio")
(setq wl-smtp-posting-server "mail.netfarm.it")
;; (setq wl-local-domain "gmail.com")

;; (setq elmo-imap4-use-modified-utf7 t)

(autoload 'wl-user-agent-compose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

(setq mime-edit-split-message nil)
(add-hook 'wl-draft-mode-hook
	  (lambda () 
	    (define-key wl-draft-mode-map (kbd "C-SPC") 'bbdb-complete-name)
	    ))
(add-hook 'mime-view-mode-hook
	  (lambda () 
	    (local-set-key (kbd "C-s") 'mime-preview-extract-current-entity)
	    ))




(require 'bbdb-wl)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet/common/w3m")
(require 'w3m-load)
(require 'w3m)
(require 'mime-w3m)


;; (require 'sb-atom-hash)
;; (setq shimbun-atom-hash-group-path-alist
;;       '(("PlanetEmacsen" "http://planet.emacsen.org/atom.xml" t)
;; 	("Stackoverflow: Emacs" "http://stackoverflow.com/feeds/tag/emacs" t)))


;; (add-hook 'w3m-mode-hook '(lambda () 
;; 			    (define-key w3m-mode-map (kbd "<down>") 'next-line)
;; 			    (define-key w3m-mode-map (kbd "<right>") 'forward-char)
;; 			    (define-key w3m-mode-map (kbd "<left>") 'backward-char)
;; 			    (define-key w3m-mode-map (kbd "<up>") 'previous-line)
;; 			    (define-key w3m-mode-map (kbd "<S-down>") 'next-line)
;; 			    (define-key w3m-mode-map (kbd "<S-right>") 'forward-char)
;; 			    (define-key w3m-mode-map (kbd "<S-left>") 'backward-char)
;; 			    (define-key w3m-mode-map (kbd "<S-up>") 'previous-line)			    ))


(define-key w3m-minor-mode-map (kbd "<down>") 'next-line)
(define-key w3m-minor-mode-map (kbd "<right>") 'forward-char)
(define-key w3m-minor-mode-map (kbd "<left>") 'backward-char)
(define-key w3m-minor-mode-map (kbd "<up>") 'previous-line)
(define-key w3m-minor-mode-map (kbd "<S-down>") 'next-line)
(define-key w3m-minor-mode-map (kbd "<S-right>") 'forward-char)
(define-key w3m-minor-mode-map (kbd "<S-left>") 'backward-char)
(define-key w3m-minor-mode-map (kbd "<S-up>") 'previous-line)

(bbdb-wl-setup)
;; enable pop-ups
(setq bbdb-use-pop-up t)
;; auto collection
(setq bbdb-popup-target-lines  1)
;; very small
(setq bbdb-completion-type nil)
;; complete on anything
(setq bbdb-complete-name-allow-cycling t)
;; cycle through matches
;; this only works partially

(setq bbdb/mail-auto-create-p t)
;; exceptional folders against auto collection
(setq bbdb-wl-ignore-folder-regexp "^@")
(setq signature-use-bbdb t)
(setq bbdb-north-american-phone-numbers-p nil)
;; shows the name of bbdb in the summary :-)
(setq wl-summary-from-function 'bbdb-wl-from-func)
;; automatically add mailing list fields
(add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)
(setq bbdb-auto-notes-alist '(("X-ML-Name" (".*$" ML 0))))

;; (setq bbdb-auto-notes-alist
;;           (quote (("To"
;;                    ("guancio" imported "Nota Guancio")
;;                    ("plug" . "plug")
;;                    ("linux" . "linux")
;;                    ("emacs-commit" . "emacs commit")
;;                    ("emacs" . "emacs")
;;                    ("pinoyjug" . "pinoyjug")
;;                    ("digitalfilipino" . "digitalfilipino")
;;                    ("sacha" . "personal mail")
;; 		   (".*" . "PPPP")
;; 		   )
;;                   ("From"
;;                    ("admu" company "Ateneo de Manila University")
;; 		   ("Organization" (".*" company 0 nil))
;;                   )
;; 		  )
;; 		 )
;; 	  )



(defun guancio-bbdb-imported-hook (record)
  (bbdb-record-putprop record 'imported "Yes")
)
(add-hook 'bbdb-create-hook 'guancio-bbdb-imported-hook)

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/erc/")
;; (require 'erc)
;; (require 'erc-nicklist)



;; (require 'epa)
;; (epa-file-enable)


;; (require 'jasmin)
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )






;; (require 'notmuch)

;; (require 'egg)

;; (add-to-list 'load-path "/home/guancio/Sources/byothers/malabar-mode/malabar-1.4-SNAPSHOT/lisp")
;; ;; Or enable more if you wish
;; (require 'cedet)
;; (semantic-load-enable-minimum-features) ;; or enable more if you wish
;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;; 				  global-semanticdb-minor-mode
;; 				  global-semantic-idle-summary-mode
;; 				  global-semantic-mru-bookmark-mode))
;; (semantic-mode 1)
;; (require 'malabar-mode)
;; (setq malabar-groovy-lib-dir "/home/guancio/Sources/byothers/malabar-mode/malabar-1.4-SNAPSHOT/lib")
;; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))



;; (add-to-list 'load-path "/usr/share/emacs/scala-mode")
;; (require 'scala-mode)
;; (add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
;; ;; (add-to-list 'load-path "~/.emacs.d/ensime/dist/elisp")
;; ;; (setq ensime-default-server-root "~/.emacs.d/ensime/dist/")
;; ;; (require 'ensime)
;; ;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)