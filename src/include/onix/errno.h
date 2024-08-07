#ifndef ONIX_ERRNO_H
#define ONIX_ERRNO_H

#if 0
#include <asm-generic/errno-base.h>
#include <asm-generic/errno.h>
#endif

#define TIMELESS -1 // 无限时间

#define ERROR 99        // 一般错误
#define EOK 0           // 没错
#define EPERM 1         // 操作没有许可
#define ENOENT 2        // 文件或目录不存在
#define ESRCH 3         // 指定的进程不存在
#define EINTR 4         // 中断的函数调用
#define EIO 5           // 输入输出错误
#define ENXIO 6         // 指定设备或地址不存在
#define E2BIG 7         // 参数列表太长
#define ENOEXEC 8       // 执行程序格式错误
#define EBADF 9         // 文件描述符错误
#define ECHILD 10       // 子进程不存在
#define EAGAIN 11       // 资源暂时不可用
#define ENOMEM 12       // 内存不足
#define EACCES 13       // 没有许可权限
#define EFAULT 14       // 地址错
#define ENOTBLK 15      // 不是块设备文件
#define EBUSY 16        // 资源正忙
#define EEXIST 17       // 文件已存在
#define EXDEV 18        // 非法连接
#define ENODEV 19       // 设备不存在
#define ENOTDIR 20      // 不是目录文件
#define EISDIR 21       // 是目录文件
#define EINVAL 22       // 参数无效
#define ENFILE 23       // 系统打开文件数太多
#define EMFILE 24       // 打开文件数太多
#define ENOTTY 25       // 不恰当的 IO 控制操作(没有 tty 终端)
#define ETXTBSY 26      // 不再使用
#define EFBIG 27        // 文件太大
#define ENOSPC 28       // 设备已满（设备已经没有空间）
#define ESPIPE 29       // 无效的文件指针重定位
#define EROFS 30        // 文件系统只读
#define EMLINK 31       // 连接太多
#define EPIPE 32        // 管道错
#define EDOM 33         // 域(domain)出错
#define ERANGE 34       // 结果太大
#define EDEADLK 35      // 避免资源死锁
#define ENAMETOOLONG 36 // 文件名太长
#define ENOLCK 37       // 没有锁定可用
#define ENOSYS 38       // 功能还没有实现
#define ENOTEMPTY 39    // 目录不空
#define ETIME 62        // 超时

#endif