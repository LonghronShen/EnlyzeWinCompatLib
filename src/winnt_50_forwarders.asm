;
; EnlyzeWinCompatLib - Let Clang-compiled applications run on older Windows versions
; Written by Colin Finck for ENLYZE GmbH
;

.model flat

EXTERN _LibGetModuleHandleExW@12 : PROC
EXTERN _LibInitializeSListHead@4 : PROC
EXTERN _LibInterlockedFlushSList@4 : PROC
EXTERN _LibInterlockedPushEntrySList@8 : PROC

.data

PUBLIC __imp__GetModuleHandleExW@12
__imp__GetModuleHandleExW@12 dd _LibGetModuleHandleExW@12

PUBLIC __imp__InitializeSListHead@4
__imp__InitializeSListHead@4 dd _LibInitializeSListHead@4

PUBLIC __imp__InterlockedFlushSList@4
__imp__InterlockedFlushSList@4 dd _LibInterlockedFlushSList@4

PUBLIC __imp__InterlockedPushEntrySList@8
__imp__InterlockedPushEntrySList@8 dd _LibInterlockedPushEntrySList@8

END
