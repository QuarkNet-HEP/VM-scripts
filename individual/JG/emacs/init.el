;; After altering this file, M-x load-file RET ~/.emacs in open buffers to    
;; load changes.                                                                 

(custom-set-variables
 ;; custom-set-variables was added by Custom.                                 
 ;; If you edit it by hand, you could mess it up, so be careful.              
 ;; Your init file should contain only one such instance.                     
 ;; If there is more than one, they won't work right.                         
 '(inhibit-startup-screen t)
 '(require-final-newline nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.                                     
 ;; If you edit it by hand, you could mess it up, so be careful.              
 ;; Your init file should contain only one such instance.                     
 ;; If there is more than one, they won't work right.                         
 '(region ((t (:background "gray" :distant-foreground "light gray")))))

;; Set copy/cut/paste to C-c/x/v:                                             
(cua-mode t)
 ;; additional options:                                                       
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle         
commands                                                                      
(transient-mark-mode 1) ;; No region when it is not highlighted               
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour             

;; Enable shift-select mode to be able to cut/copy a region highlighted       
;; using the cursor (as opposed to the mouse)                                 
(setq shift-select-mode t)

;; Delete region when typing over it                                          
(delete-selection-mode 1)

;; Show row and column numbers in the mode line                               
(setq line-number-mode t)
(setq column-number-mode t)
