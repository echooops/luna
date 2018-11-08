;; 启动 company 模式
(provide 'luna-company)

(luna-require-package 'company)
(require 'company)
(global-company-mode t)
;;(add-hook 'after-init-hook 'global-company-mode)


(setq company-idle-delay 0.2;菜单延迟
      company-minimum-prefix-length 1; 开始补全字数
      company-require-match nil
      company-dabbrev-ignore-case nil
      company-dabbrev-downcase nil
      company-show-numbers t; 显示序号
      company-transformers '(company-sort-by-backend-importance)
      company-continue-commands '(not helm-dabbrev))
