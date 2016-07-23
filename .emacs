; add MELPA to repositor(require 'package)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this liney list

; set font size
;(set-face-attribute 'default (selected-frame) :height 10)
;(set-face-attribute 'default nil :height 100)

; tabbar mode
(require 'tabbar)
(tabbar-mode 1)

(global-set-key (kbd "<M-left>") 'tabbar-backward)
(global-set-key (kbd "<M-right>") 'tabbar-forward)

(set-face-attribute
 'tabbar-default nil
 :background "gray20"
 :foreground "gray20"
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-unselected nil
 :background "gray30"
 :foreground "white"
 :box '(:line-width 5 :color "gray30" :style nil))
(set-face-attribute
 'tabbar-selected nil
 :background "gray75"
 :foreground "black"
 :box '(:line-width 5 :color "gray75" :style nil))
(set-face-attribute
 'tabbar-highlight nil
 :background "white"
 :foreground "black"
 :underline nil
 :box '(:line-width 5 :color "white" :style nil))
(set-face-attribute
 'tabbar-button nil
 :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute
 'tabbar-separator nil
 :background "gray20"
 :height 0.6)

;; cc-mode
(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; autopair
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/5.4.0/include-fixed")
  )

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; Fix iedit bug in Mac
(define-key global-map (kbd "C-;") 'iedit-mode)

; turn on Semantic
(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(global-semantic-idle-scheduler-mode 1)

;; turn on font highlight
(global-font-lock-mode 1)
;; turn on highlight selected part
(transient-mark-mode t)
;; smooth scroll
;; (setq scroll-margin 3 scroll-consrvatively 10000)
;; highlight paired parenthese
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; avoid mouse
(mouse-avoidance-mode 'animate)
;; paste at curse not mouse
(setq mouse-yank-at-point t)

;; 显示行号
(require 'linum)
(global-linum-mode t)
;; 高亮当前行
;;(global-hl-line-mode 1)

;; do not generate backup file
(setq make-backup-files nil)
(setq-default make-backup-files nil)
;;只渲染当前屏幕语法高亮，加快显示速度
(setq lazy-lock-defer-on-scrolling t)
;;(setq font-lock-support-mode 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)
;;将错误信息显示在回显区
(condition-case err
	(progn
	  (require 'xxx))
  (error
   (message "Can't load xxx-mode %s" (cdr err))))
;;使用X剪贴板
(setq x-select-enable-clipboard t)
;;设定剪贴板的内容格式 适应Firefox
(set-clipboard-coding-system 'ctext)

;; ido-mode: show paths when finding file
(ido-mode t)

;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;可以递归的使用 minibuffer
(setq enable-recursive-minibuffers t)

;; 在行首 C-k 时，同时删除该行。
(setq-default kill-whole-line t)

;;设置缺省主模式是text，,并进入auto-fill次模式.而不是基本模式fundamental-mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;把这些缺省禁用的功能打开
(put 'scroll-left 'disabled nil)     ;允许屏幕左移
(put 'scroll-right 'disabled nil)    ;允许屏幕右移
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;;设置默认工作目录
(setq default-directory "~/work/")

;;;; 添加Emacs搜索路径
;;(add-to-list 'load-path "~/_emacs")
;;(add-to-list 'load-path "~/_emacs/codepilot")
;;(add-to-list 'load-path "~/_emacs/emacs-eclim")
;;(add-to-list 'load-path "~/_emacs/icicles")
;;(add-to-list 'load-path "~/_emacs/gnuserv")

(setq gdb-many-windows t)
;;...
;;(load-library "multi-gud.el")
;;(load-library "multi-gdb-ui.el")

;;===========================================================
;;key bind
;;===========================================================
(require 'redo+)
(global-set-key ( kbd "C-.") 'redo)
(global-set-key [f1] 'manual-entry)
(global-set-key [C-f1] 'info )

;;.emacs中设一个speedbar的快捷键
(global-set-key [(f4)] 'speedbar-get-focus)
;;ctrl-f4,激活,ecb
(global-set-key [C-f4] 'ecb-activate)

;;F5显示/隐藏工
(global-set-key [f5] 'gdb)
;;ctrl-F5显示/隐藏菜单栏 ;; M-x menu-bar-open
(global-set-key [C-f5] 'menu-bar-mode)

(add-hook 'gdb-mode-hook '(lambda ()
                            (define-key c-mode-base-map [(f5)] 'gud-go)
                            (define-key c-mode-base-map [(f6)] 'gud-step)
                            (define-key c-mode-base-map [(f7)] 'gud-next)))

;;目的是开一个shell的小buffer，用于更方便地测试程序(也就是运行程序了)，我经常会用到。
;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell,shift+f8清空eshell
(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (shell))
(defun my-eshell-clear-buffer ()
  "Eshell clear buffer."
  (interactive)
  (let ((eshell-buffer-maximum-lines 0))
    (eshell-truncate-buffer)))
;(global-set-key "\C-cs" 'shell)
(global-set-key [(f8)] 'open-eshell-other-buffer)
(global-set-key [C-f8] 'shell)
(global-set-key [S-f8] 'my-eshell-clear-buffer)

;;设置[C-f9]为调用dired命令
(global-set-key [C-f9] 'dired)
(global-set-key [f9] 'other-window);f9在其他窗口之间旋转
(global-set-key (kbd "<f11>") 'repeat-matching-complex-command)
(global-set-key (kbd "<f12>") 'repeat-complex-command)

;;设置F10为撤销
;;(global-set-key [C-f10] 'undo)

;;设置F11快捷键指定Emacs 的日历系统
;;(global-set-key [C-f11] 'calendar)

;;设置C-F12 快速察看日程安排
;;F12调到函数定义
;;(global-set-key [f12] 'semantic-ia-fast-jump)
;;(global-set-key [C-f12] 'list-bookmarks)
;;shift-f12跳回去

;;C-z 设置标记
;;(global-set-key (kbd "C-z") 'set-mark-command)
;;关闭当前窗口,alt+4
(global-set-key (kbd "M-4") 'delete-window)
;;(global-set-key (kbd "M-4") 'kill-this-buffer)
;;关闭其他窗口,alt+1
(global-set-key (kbd "M-1") 'delete-other-windows)
;;水平分割窗口,alt+2
(global-set-key (kbd "M-2") 'split-window-vertically)
;;垂直分割窗口,alt+3
(global-set-key (kbd "M-3") 'split-window-horizontally)
;;切换到其他窗口，alt+0
(global-set-key (kbd "M-0") 'other-window)
;;显示缓冲区完整名称
;;(global-set-key (kbd "M-5") 'display-buffer-name)



;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

(global-font-lock-mode t)
(column-number-mode t)
(line-number-mode t)

(defun my-c-mode-hook ()
  ; make the ENTER key indent next line properly
  (local-set-key "\C-m" 'newline-and-indent)
  (local-set-key "\C-cc" 'compile)
  ; (setq font-lock-support-mode 'lazy-lock-mode)
  (setq font-lock-support-mode 'jit-lock-mode)
  (setq lazy-lock-defer-contextually t)
  (setq lazy-lock-defer-time 0)
  (setq c-default-style "linux")
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)
  (require 'whitespace)
  (setq whitespace-style '(face lines-tail trailing))
  (whitespace-mode t)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (setq c-offsets-alist
   '(
     (c . +)
     (comment-intro . 0)

     (namespace-open . 0)
     (namespace-close . 0)
     (innamespace . 0)

     (class-open . 0)
     (class-close . 0)
     (inclass . +)

     (defun-open . 0)
     (defun-close . 0)
     (defun-block-intro . +)
     (func-decl-cont . +)

     (inline-open . 0)
     (inline-close . 0)

     (block-open . 0)
     (block-close . 0)

     (statement-block-intro . +)
     (statement-block . 0)
     (statement-cont . +)
     (statement-case-intro . +)
     (statement-case-open . +)

     (substatement . +)
     (substatement-open . 0)

     (label . *)
     (access-label . /)
     (case-label . *)

;     (arglist-intro . c-lineup-arglist-intro-after-paren)
     (arglist-intro . +)
     (arglist-cont-nonempty . c-lineup-arglist)
     (arglist-close . c-lineup-close-paren)

     (template-args-cont . c-lineup-template-args)

     (stream-op . c-lineup-streamop)

     (cpp-macro . 0)

     (brace-list-intro . +)
     (member-init-intro . +)
     (extern-lang-open . 0)
     (extern-lang-close . 0)
     (inextern-lang . 0)
    )
   )
)

(defun my-tex-mode-hook ()
  (auto-fill-mode t)
  (set-fill-column 90)
)

(add-hook 'c++-mode-hook 'my-c-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'java-mode-hook 'my-c-mode-hook)
(add-hook 'latex-mode-hook 'my-tex-mode-hook)

(add-to-list 'auto-mode-alist '("\\make.+\\.rules" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\(M\\|m\\)akefile\\." . makefile-mode))

;;(set-background-color "light yellow")
(set-background-color "black")


;; magit settings
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "light yellow" :foreground "#141312" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 135 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(magit-item-highlight ((t nil))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
