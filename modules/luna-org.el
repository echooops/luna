(require 'org)

(provide 'luna-org)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(add-hook 'org-mode-hook 'rainbow-mode)

(add-hook 'org-mode-hook
          '(lambda ()
             ;; 基本的一些按键绑定
             ;; 切换使用 org-mode 的文件 buffers
             (local-set-key (kbd "C-c b") 'org-switchb)
             ;; turn on flyspell-mode by default
             (flyspell-mode 1)
             ;; C-TAB for expanding 触发补全
             (local-set-key (kbd "C-<tab>") 'yas/expand-from-trigger-key)

             ;; 自定义函数的一些按键绑定
             ;; keybinding for editing source code blocks
             (local-set-key (kbd "C-c s e") 'org-edit-src-code)
             ;; keybinding for inserting code blocks
             (local-set-key (kbd "C-c s i") 'org-insert-src-block)))
;; 设置 org 目录
(setq org-directory "~/Documents/org")
;; 支持设置代码块高亮
(setq org-src-fontify-natively t)
;; 支持代码块中<TAB>操作
(setq org-src-tab-acts-natively t)
;; 中文表格排列不整齐
(setq fonts
      (cond ((eq system-type 'darwin)     '("Monaco"    "STHeiti"))
            ((eq system-type 'gnu/linux)  '("Menlo"     "WenQuanYi Zen Hei"))
            ((eq system-type 'windows-nt) '("Consolas"  "Microsoft Yahei"))))
(set-face-attribute 'default nil :font
                    (format "%s:pixelsize=%d" (car fonts) 14))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font) charset
                    (font-spec :family (car (cdr fonts)))))
;; Fix chinese font width and rescale
(setq face-font-rescale-alist '(("Microsoft Yahei" . 1.2) ("WenQuanYi Micro Hei Mono" . 1.2) ("STHeiti". 1.2)))

;; org-insert-src-block (插入代码块函数) 为了不用自己输入 #+BEGIN_SRC … #+END_SRC 这一段，我写了下面这个Elisp函数
(defun org-insert-src-block (src-code-type)
  "Insert a 'SRC-CODE-TYPE type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code))
  )
