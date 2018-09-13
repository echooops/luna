;; ==============================================================
;;
;;                                    .-') _     ('-.
;;                                   ( OO ) )   ( OO ).-. 
;;        ,--.       ,--. ,--.   ,--./ ,--,'    / . --. / 
;;        |  |.-')   |  | |  |   |   \ |  |\    | \-.  \  
;;        |  | OO )  |  | | .-') |    \|  | ) .-'-'  |  | 
;;        |  |`-' |  |  |_|( OO )|  .     |/   \| |_.'  | 
;;       (|  '---.'  |  | | `-' /|  |\    |     |  .-.  | 
;;        |      |  ('  '-'(_.-' |  | \   |     |  | |  | 
;;        `------'    `-----'    `--'  `--'     `--' `--'
;;
;; ==============================================================
;; 获取计算机名
;; ==============================================================
(if (or
     (eq system-type 'darwin)
     (eq system-type 'berkeley-unix))
    (setq system-name (car (split-string system-name "\\."))))
;; ==============================================================
;; 获取主人昵称
;; ==============================================================
(defvar current-user
  (getenv
   (if (equal system-type 'windows-nt) "USERNAME" "USER")))
;; ==============================================================
;; 欢迎主人
;; ==============================================================
(message "Luna is powering up... Be patient, Master %s!" current-user)
;; ==============================================================
;; 版本检查
;; ==============================================================
(when (version< emacs-version "25.1")
  (error
   "Luna requires GNU Emacs 25.1 or newer, but you're running %s"
   emacs-version))
;; ==============================================================
;; 月亮女神护佑着你
;; ==============================================================
;; load the starter kit from the `after-init-hook' so all packages are loaded
;;(defvar luna-dir (file-name-directory load-file-name)
;;  "The root dir of the Emacs Luna distribution.")
(defvar luna-dir "~/Github/luna/"
  "The root dir of the Emacs Luna distribution.")

(add-hook 'after-init-hook
          '(lambda ()
             (let ((load-file (expand-file-name "readme.org" luna-dir)))
               (org-babel-load-file load-file))))
;; ==============================================================
;; 加载完成
;; ==============================================================
(message "Luna loading completed, Master %s!" current-user)
;; ==============================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ghub magit luna-theme monokai-theme monokai yasnippet company-rtags flycheck-rtags beacon which-key company-irony-c-headers company-irony flycheck-irony irony zenburn-theme helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
