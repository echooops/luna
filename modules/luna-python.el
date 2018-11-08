(provide 'luna-python)
;; 启动elpy
(luna-require-package 'elpy)
(require 'elpy nil t)
(elpy-enable)
 ;; python3
(setq elpy-rpc-python-command "python2.7")

(luna-require-package 'flycheck)
(require 'flycheck)
(add-hook 'python-mode-hook 'flycheck-mode)

(require 'luna-company)
(luna-require-package 'company-anaconda)
; 补全后端使用anaconda
(add-to-list 'company-backends '(company-anaconda :with company-yasnippet))
; 补全快捷键
(global-set-key (kbd "<C-tab>") 'company-complete)
; 补全菜单选项快捷键
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; 在python模式中自动启用
(add-hook 'python-mode-hook 'anaconda-mode)

;; ein emacs ipython notebook
(luna-require-package 'ein)
