(defun guancio-isearch-occur ()
  "Find all occurrences of the word (searched within isearch) into the current buffer and displays the result in a new window"
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))

(defun guancio-isearch-grep ()
  "Find all occurrences of the word (searched within isearch) into the buffer path and displays the result in a new window"
  (interactive)
  (let ((shk-search-string isearch-string))
    (grep-compute-defaults)
    (lgrep (if isearch-regexp shk-search-string (regexp-quote shk-search-string))
	   (format "*.%s" (file-name-extension (buffer-file-name)))
	   default-directory)
    (isearch-abort)))

(provide 'guancio_search)
