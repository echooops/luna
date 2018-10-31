(provide 'luna-plantuml)

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)))

;; plantuml.jar 路径
(setq org-plantuml-jar-path
      (expand-file-name "/Users/echo/bin/plantuml.jar"))
