(require 'cl)
(require 'package)

(provide 'luna-package)

(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives
                 '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t))
(package-initialize)

(setq package-user-dir (expand-file-name "elpa" luna-dir))

(defvar luna-packages
  '(rtags
    irony
    company
    company-rtags
    company-irony
    company-irony-c-headers
    flycheck
    flycheck-rtags
    flycheck-irony
    yasnippet
    markdown-mode
    clang-format
    cmake-ide
    monokai-theme)
  "A list of packages to ensure are installed at launch.")

(defun luna-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package luna-packages)
    (add-to-list 'luna-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun luna-require-packages (packages)
  "Ensure PACKAGES are installed. Missing packages are installed automatically."
  (mapc #'luna-require-package packages))
