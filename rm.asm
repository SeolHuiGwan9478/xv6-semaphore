
_rm:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
  12:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
  14:	83 3b 01             	cmpl   $0x1,(%ebx)
  17:	7f 17                	jg     30 <main+0x30>
    printf(2, "Usage: rm files...\n");
  19:	83 ec 08             	sub    $0x8,%esp
  1c:	68 04 09 00 00       	push   $0x904
  21:	6a 02                	push   $0x2
  23:	e8 72 04 00 00       	call   49a <printf>
  28:	83 c4 10             	add    $0x10,%esp
    exit();
  2b:	e8 b7 02 00 00       	call   2e7 <exit>
  }

  for(i = 1; i < argc; i++){
  30:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  37:	eb 4b                	jmp    84 <main+0x84>
    if(unlink(argv[i]) < 0){
  39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  43:	8b 43 04             	mov    0x4(%ebx),%eax
  46:	01 d0                	add    %edx,%eax
  48:	8b 00                	mov    (%eax),%eax
  4a:	83 ec 0c             	sub    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	e8 e4 02 00 00       	call   337 <unlink>
  53:	83 c4 10             	add    $0x10,%esp
  56:	85 c0                	test   %eax,%eax
  58:	79 26                	jns    80 <main+0x80>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  64:	8b 43 04             	mov    0x4(%ebx),%eax
  67:	01 d0                	add    %edx,%eax
  69:	8b 00                	mov    (%eax),%eax
  6b:	83 ec 04             	sub    $0x4,%esp
  6e:	50                   	push   %eax
  6f:	68 18 09 00 00       	push   $0x918
  74:	6a 02                	push   $0x2
  76:	e8 1f 04 00 00       	call   49a <printf>
  7b:	83 c4 10             	add    $0x10,%esp
      break;
  7e:	eb 0b                	jmp    8b <main+0x8b>
  for(i = 1; i < argc; i++){
  80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  87:	3b 03                	cmp    (%ebx),%eax
  89:	7c ae                	jl     39 <main+0x39>
    }
  }

  exit();
  8b:	e8 57 02 00 00       	call   2e7 <exit>

00000090 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	57                   	push   %edi
  94:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  95:	8b 4d 08             	mov    0x8(%ebp),%ecx
  98:	8b 55 10             	mov    0x10(%ebp),%edx
  9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  9e:	89 cb                	mov    %ecx,%ebx
  a0:	89 df                	mov    %ebx,%edi
  a2:	89 d1                	mov    %edx,%ecx
  a4:	fc                   	cld    
  a5:	f3 aa                	rep stos %al,%es:(%edi)
  a7:	89 ca                	mov    %ecx,%edx
  a9:	89 fb                	mov    %edi,%ebx
  ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ae:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b1:	90                   	nop
  b2:	5b                   	pop    %ebx
  b3:	5f                   	pop    %edi
  b4:	5d                   	pop    %ebp
  b5:	c3                   	ret    

000000b6 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  b6:	55                   	push   %ebp
  b7:	89 e5                	mov    %esp,%ebp
  b9:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  bc:	8b 45 08             	mov    0x8(%ebp),%eax
  bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c2:	90                   	nop
  c3:	8b 55 0c             	mov    0xc(%ebp),%edx
  c6:	8d 42 01             	lea    0x1(%edx),%eax
  c9:	89 45 0c             	mov    %eax,0xc(%ebp)
  cc:	8b 45 08             	mov    0x8(%ebp),%eax
  cf:	8d 48 01             	lea    0x1(%eax),%ecx
  d2:	89 4d 08             	mov    %ecx,0x8(%ebp)
  d5:	0f b6 12             	movzbl (%edx),%edx
  d8:	88 10                	mov    %dl,(%eax)
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	75 e2                	jne    c3 <strcpy+0xd>
    ;
  return os;
  e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e4:	c9                   	leave  
  e5:	c3                   	ret    

000000e6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e6:	55                   	push   %ebp
  e7:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e9:	eb 08                	jmp    f3 <strcmp+0xd>
    p++, q++;
  eb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ef:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 00             	movzbl (%eax),%eax
  f9:	84 c0                	test   %al,%al
  fb:	74 10                	je     10d <strcmp+0x27>
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 10             	movzbl (%eax),%edx
 103:	8b 45 0c             	mov    0xc(%ebp),%eax
 106:	0f b6 00             	movzbl (%eax),%eax
 109:	38 c2                	cmp    %al,%dl
 10b:	74 de                	je     eb <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 10d:	8b 45 08             	mov    0x8(%ebp),%eax
 110:	0f b6 00             	movzbl (%eax),%eax
 113:	0f b6 d0             	movzbl %al,%edx
 116:	8b 45 0c             	mov    0xc(%ebp),%eax
 119:	0f b6 00             	movzbl (%eax),%eax
 11c:	0f b6 c0             	movzbl %al,%eax
 11f:	29 c2                	sub    %eax,%edx
 121:	89 d0                	mov    %edx,%eax
}
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <strlen>:

uint
strlen(char *s)
{
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 12b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 132:	eb 04                	jmp    138 <strlen+0x13>
 134:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 138:	8b 55 fc             	mov    -0x4(%ebp),%edx
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	01 d0                	add    %edx,%eax
 140:	0f b6 00             	movzbl (%eax),%eax
 143:	84 c0                	test   %al,%al
 145:	75 ed                	jne    134 <strlen+0xf>
    ;
  return n;
 147:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 14a:	c9                   	leave  
 14b:	c3                   	ret    

0000014c <memset>:

void*
memset(void *dst, int c, uint n)
{
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 14f:	8b 45 10             	mov    0x10(%ebp),%eax
 152:	50                   	push   %eax
 153:	ff 75 0c             	pushl  0xc(%ebp)
 156:	ff 75 08             	pushl  0x8(%ebp)
 159:	e8 32 ff ff ff       	call   90 <stosb>
 15e:	83 c4 0c             	add    $0xc,%esp
  return dst;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
}
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	83 ec 04             	sub    $0x4,%esp
 16c:	8b 45 0c             	mov    0xc(%ebp),%eax
 16f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 172:	eb 14                	jmp    188 <strchr+0x22>
    if(*s == c)
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	38 45 fc             	cmp    %al,-0x4(%ebp)
 17d:	75 05                	jne    184 <strchr+0x1e>
      return (char*)s;
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	eb 13                	jmp    197 <strchr+0x31>
  for(; *s; s++)
 184:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 188:	8b 45 08             	mov    0x8(%ebp),%eax
 18b:	0f b6 00             	movzbl (%eax),%eax
 18e:	84 c0                	test   %al,%al
 190:	75 e2                	jne    174 <strchr+0xe>
  return 0;
 192:	b8 00 00 00 00       	mov    $0x0,%eax
}
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <gets>:

char*
gets(char *buf, int max)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1a6:	eb 42                	jmp    1ea <gets+0x51>
    cc = read(0, &c, 1);
 1a8:	83 ec 04             	sub    $0x4,%esp
 1ab:	6a 01                	push   $0x1
 1ad:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1b0:	50                   	push   %eax
 1b1:	6a 00                	push   $0x0
 1b3:	e8 47 01 00 00       	call   2ff <read>
 1b8:	83 c4 10             	add    $0x10,%esp
 1bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1c2:	7e 33                	jle    1f7 <gets+0x5e>
      break;
    buf[i++] = c;
 1c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c7:	8d 50 01             	lea    0x1(%eax),%edx
 1ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1cd:	89 c2                	mov    %eax,%edx
 1cf:	8b 45 08             	mov    0x8(%ebp),%eax
 1d2:	01 c2                	add    %eax,%edx
 1d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1da:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1de:	3c 0a                	cmp    $0xa,%al
 1e0:	74 16                	je     1f8 <gets+0x5f>
 1e2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e6:	3c 0d                	cmp    $0xd,%al
 1e8:	74 0e                	je     1f8 <gets+0x5f>
  for(i=0; i+1 < max; ){
 1ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ed:	83 c0 01             	add    $0x1,%eax
 1f0:	39 45 0c             	cmp    %eax,0xc(%ebp)
 1f3:	7f b3                	jg     1a8 <gets+0xf>
 1f5:	eb 01                	jmp    1f8 <gets+0x5f>
      break;
 1f7:	90                   	nop
      break;
  }
  buf[i] = '\0';
 1f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	01 d0                	add    %edx,%eax
 200:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 203:	8b 45 08             	mov    0x8(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <stat>:

int
stat(char *n, struct stat *st)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20e:	83 ec 08             	sub    $0x8,%esp
 211:	6a 00                	push   $0x0
 213:	ff 75 08             	pushl  0x8(%ebp)
 216:	e8 0c 01 00 00       	call   327 <open>
 21b:	83 c4 10             	add    $0x10,%esp
 21e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 221:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 225:	79 07                	jns    22e <stat+0x26>
    return -1;
 227:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 22c:	eb 25                	jmp    253 <stat+0x4b>
  r = fstat(fd, st);
 22e:	83 ec 08             	sub    $0x8,%esp
 231:	ff 75 0c             	pushl  0xc(%ebp)
 234:	ff 75 f4             	pushl  -0xc(%ebp)
 237:	e8 03 01 00 00       	call   33f <fstat>
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 242:	83 ec 0c             	sub    $0xc,%esp
 245:	ff 75 f4             	pushl  -0xc(%ebp)
 248:	e8 c2 00 00 00       	call   30f <close>
 24d:	83 c4 10             	add    $0x10,%esp
  return r;
 250:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 253:	c9                   	leave  
 254:	c3                   	ret    

00000255 <atoi>:

int
atoi(const char *s)
{
 255:	55                   	push   %ebp
 256:	89 e5                	mov    %esp,%ebp
 258:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 25b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 262:	eb 25                	jmp    289 <atoi+0x34>
    n = n*10 + *s++ - '0';
 264:	8b 55 fc             	mov    -0x4(%ebp),%edx
 267:	89 d0                	mov    %edx,%eax
 269:	c1 e0 02             	shl    $0x2,%eax
 26c:	01 d0                	add    %edx,%eax
 26e:	01 c0                	add    %eax,%eax
 270:	89 c1                	mov    %eax,%ecx
 272:	8b 45 08             	mov    0x8(%ebp),%eax
 275:	8d 50 01             	lea    0x1(%eax),%edx
 278:	89 55 08             	mov    %edx,0x8(%ebp)
 27b:	0f b6 00             	movzbl (%eax),%eax
 27e:	0f be c0             	movsbl %al,%eax
 281:	01 c8                	add    %ecx,%eax
 283:	83 e8 30             	sub    $0x30,%eax
 286:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 289:	8b 45 08             	mov    0x8(%ebp),%eax
 28c:	0f b6 00             	movzbl (%eax),%eax
 28f:	3c 2f                	cmp    $0x2f,%al
 291:	7e 0a                	jle    29d <atoi+0x48>
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	0f b6 00             	movzbl (%eax),%eax
 299:	3c 39                	cmp    $0x39,%al
 29b:	7e c7                	jle    264 <atoi+0xf>
  return n;
 29d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2b4:	eb 17                	jmp    2cd <memmove+0x2b>
    *dst++ = *src++;
 2b6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2b9:	8d 42 01             	lea    0x1(%edx),%eax
 2bc:	89 45 f8             	mov    %eax,-0x8(%ebp)
 2bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c2:	8d 48 01             	lea    0x1(%eax),%ecx
 2c5:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 2c8:	0f b6 12             	movzbl (%edx),%edx
 2cb:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2cd:	8b 45 10             	mov    0x10(%ebp),%eax
 2d0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2d3:	89 55 10             	mov    %edx,0x10(%ebp)
 2d6:	85 c0                	test   %eax,%eax
 2d8:	7f dc                	jg     2b6 <memmove+0x14>
  return vdst;
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2dd:	c9                   	leave  
 2de:	c3                   	ret    

000002df <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2df:	b8 01 00 00 00       	mov    $0x1,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <exit>:
SYSCALL(exit)
 2e7:	b8 02 00 00 00       	mov    $0x2,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <wait>:
SYSCALL(wait)
 2ef:	b8 03 00 00 00       	mov    $0x3,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <pipe>:
SYSCALL(pipe)
 2f7:	b8 04 00 00 00       	mov    $0x4,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <read>:
SYSCALL(read)
 2ff:	b8 05 00 00 00       	mov    $0x5,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <write>:
SYSCALL(write)
 307:	b8 10 00 00 00       	mov    $0x10,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <close>:
SYSCALL(close)
 30f:	b8 15 00 00 00       	mov    $0x15,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <kill>:
SYSCALL(kill)
 317:	b8 06 00 00 00       	mov    $0x6,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <exec>:
SYSCALL(exec)
 31f:	b8 07 00 00 00       	mov    $0x7,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <open>:
SYSCALL(open)
 327:	b8 0f 00 00 00       	mov    $0xf,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <mknod>:
SYSCALL(mknod)
 32f:	b8 11 00 00 00       	mov    $0x11,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <unlink>:
SYSCALL(unlink)
 337:	b8 12 00 00 00       	mov    $0x12,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <fstat>:
SYSCALL(fstat)
 33f:	b8 08 00 00 00       	mov    $0x8,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <link>:
SYSCALL(link)
 347:	b8 13 00 00 00       	mov    $0x13,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <mkdir>:
SYSCALL(mkdir)
 34f:	b8 14 00 00 00       	mov    $0x14,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <chdir>:
SYSCALL(chdir)
 357:	b8 09 00 00 00       	mov    $0x9,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <dup>:
SYSCALL(dup)
 35f:	b8 0a 00 00 00       	mov    $0xa,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <getpid>:
SYSCALL(getpid)
 367:	b8 0b 00 00 00       	mov    $0xb,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <sbrk>:
SYSCALL(sbrk)
 36f:	b8 0c 00 00 00       	mov    $0xc,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <sleep>:
SYSCALL(sleep)
 377:	b8 0d 00 00 00       	mov    $0xd,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <uptime>:
SYSCALL(uptime)
 37f:	b8 0e 00 00 00       	mov    $0xe,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <halt>:
SYSCALL(halt)
 387:	b8 16 00 00 00       	mov    $0x16,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <getnp>:
SYSCALL(getnp)
 38f:	b8 17 00 00 00       	mov    $0x17,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <sem_create>:
SYSCALL(sem_create)
 397:	b8 18 00 00 00       	mov    $0x18,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <sem_destroy>:
SYSCALL(sem_destroy)
 39f:	b8 19 00 00 00       	mov    $0x19,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <sem_wait>:
SYSCALL(sem_wait)
 3a7:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <sem_signal>:
SYSCALL(sem_signal)
 3af:	b8 1b 00 00 00       	mov    $0x1b,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <clone>:
SYSCALL(clone)
 3b7:	b8 1c 00 00 00       	mov    $0x1c,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <join>:
SYSCALL(join)
 3bf:	b8 1d 00 00 00       	mov    $0x1d,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	83 ec 18             	sub    $0x18,%esp
 3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3d3:	83 ec 04             	sub    $0x4,%esp
 3d6:	6a 01                	push   $0x1
 3d8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3db:	50                   	push   %eax
 3dc:	ff 75 08             	pushl  0x8(%ebp)
 3df:	e8 23 ff ff ff       	call   307 <write>
 3e4:	83 c4 10             	add    $0x10,%esp
}
 3e7:	90                   	nop
 3e8:	c9                   	leave  
 3e9:	c3                   	ret    

000003ea <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3f0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3f7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3fb:	74 17                	je     414 <printint+0x2a>
 3fd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 401:	79 11                	jns    414 <printint+0x2a>
    neg = 1;
 403:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	f7 d8                	neg    %eax
 40f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 412:	eb 06                	jmp    41a <printint+0x30>
  } else {
    x = xx;
 414:	8b 45 0c             	mov    0xc(%ebp),%eax
 417:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 41a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 421:	8b 4d 10             	mov    0x10(%ebp),%ecx
 424:	8b 45 ec             	mov    -0x14(%ebp),%eax
 427:	ba 00 00 00 00       	mov    $0x0,%edx
 42c:	f7 f1                	div    %ecx
 42e:	89 d1                	mov    %edx,%ecx
 430:	8b 45 f4             	mov    -0xc(%ebp),%eax
 433:	8d 50 01             	lea    0x1(%eax),%edx
 436:	89 55 f4             	mov    %edx,-0xc(%ebp)
 439:	0f b6 91 c0 0b 00 00 	movzbl 0xbc0(%ecx),%edx
 440:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 444:	8b 4d 10             	mov    0x10(%ebp),%ecx
 447:	8b 45 ec             	mov    -0x14(%ebp),%eax
 44a:	ba 00 00 00 00       	mov    $0x0,%edx
 44f:	f7 f1                	div    %ecx
 451:	89 45 ec             	mov    %eax,-0x14(%ebp)
 454:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 458:	75 c7                	jne    421 <printint+0x37>
  if(neg)
 45a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 45e:	74 2d                	je     48d <printint+0xa3>
    buf[i++] = '-';
 460:	8b 45 f4             	mov    -0xc(%ebp),%eax
 463:	8d 50 01             	lea    0x1(%eax),%edx
 466:	89 55 f4             	mov    %edx,-0xc(%ebp)
 469:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 46e:	eb 1d                	jmp    48d <printint+0xa3>
    putc(fd, buf[i]);
 470:	8d 55 dc             	lea    -0x24(%ebp),%edx
 473:	8b 45 f4             	mov    -0xc(%ebp),%eax
 476:	01 d0                	add    %edx,%eax
 478:	0f b6 00             	movzbl (%eax),%eax
 47b:	0f be c0             	movsbl %al,%eax
 47e:	83 ec 08             	sub    $0x8,%esp
 481:	50                   	push   %eax
 482:	ff 75 08             	pushl  0x8(%ebp)
 485:	e8 3d ff ff ff       	call   3c7 <putc>
 48a:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 48d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 491:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 495:	79 d9                	jns    470 <printint+0x86>
}
 497:	90                   	nop
 498:	c9                   	leave  
 499:	c3                   	ret    

0000049a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 49a:	55                   	push   %ebp
 49b:	89 e5                	mov    %esp,%ebp
 49d:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4a0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4a7:	8d 45 0c             	lea    0xc(%ebp),%eax
 4aa:	83 c0 04             	add    $0x4,%eax
 4ad:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4b0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4b7:	e9 59 01 00 00       	jmp    615 <printf+0x17b>
    c = fmt[i] & 0xff;
 4bc:	8b 55 0c             	mov    0xc(%ebp),%edx
 4bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4c2:	01 d0                	add    %edx,%eax
 4c4:	0f b6 00             	movzbl (%eax),%eax
 4c7:	0f be c0             	movsbl %al,%eax
 4ca:	25 ff 00 00 00       	and    $0xff,%eax
 4cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4d2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d6:	75 2c                	jne    504 <printf+0x6a>
      if(c == '%'){
 4d8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4dc:	75 0c                	jne    4ea <printf+0x50>
        state = '%';
 4de:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4e5:	e9 27 01 00 00       	jmp    611 <printf+0x177>
      } else {
        putc(fd, c);
 4ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4ed:	0f be c0             	movsbl %al,%eax
 4f0:	83 ec 08             	sub    $0x8,%esp
 4f3:	50                   	push   %eax
 4f4:	ff 75 08             	pushl  0x8(%ebp)
 4f7:	e8 cb fe ff ff       	call   3c7 <putc>
 4fc:	83 c4 10             	add    $0x10,%esp
 4ff:	e9 0d 01 00 00       	jmp    611 <printf+0x177>
      }
    } else if(state == '%'){
 504:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 508:	0f 85 03 01 00 00    	jne    611 <printf+0x177>
      if(c == 'd'){
 50e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 512:	75 1e                	jne    532 <printf+0x98>
        printint(fd, *ap, 10, 1);
 514:	8b 45 e8             	mov    -0x18(%ebp),%eax
 517:	8b 00                	mov    (%eax),%eax
 519:	6a 01                	push   $0x1
 51b:	6a 0a                	push   $0xa
 51d:	50                   	push   %eax
 51e:	ff 75 08             	pushl  0x8(%ebp)
 521:	e8 c4 fe ff ff       	call   3ea <printint>
 526:	83 c4 10             	add    $0x10,%esp
        ap++;
 529:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 52d:	e9 d8 00 00 00       	jmp    60a <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 532:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 536:	74 06                	je     53e <printf+0xa4>
 538:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 53c:	75 1e                	jne    55c <printf+0xc2>
        printint(fd, *ap, 16, 0);
 53e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 541:	8b 00                	mov    (%eax),%eax
 543:	6a 00                	push   $0x0
 545:	6a 10                	push   $0x10
 547:	50                   	push   %eax
 548:	ff 75 08             	pushl  0x8(%ebp)
 54b:	e8 9a fe ff ff       	call   3ea <printint>
 550:	83 c4 10             	add    $0x10,%esp
        ap++;
 553:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 557:	e9 ae 00 00 00       	jmp    60a <printf+0x170>
      } else if(c == 's'){
 55c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 560:	75 43                	jne    5a5 <printf+0x10b>
        s = (char*)*ap;
 562:	8b 45 e8             	mov    -0x18(%ebp),%eax
 565:	8b 00                	mov    (%eax),%eax
 567:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 56a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 56e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 572:	75 25                	jne    599 <printf+0xff>
          s = "(null)";
 574:	c7 45 f4 31 09 00 00 	movl   $0x931,-0xc(%ebp)
        while(*s != 0){
 57b:	eb 1c                	jmp    599 <printf+0xff>
          putc(fd, *s);
 57d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 580:	0f b6 00             	movzbl (%eax),%eax
 583:	0f be c0             	movsbl %al,%eax
 586:	83 ec 08             	sub    $0x8,%esp
 589:	50                   	push   %eax
 58a:	ff 75 08             	pushl  0x8(%ebp)
 58d:	e8 35 fe ff ff       	call   3c7 <putc>
 592:	83 c4 10             	add    $0x10,%esp
          s++;
 595:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 599:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59c:	0f b6 00             	movzbl (%eax),%eax
 59f:	84 c0                	test   %al,%al
 5a1:	75 da                	jne    57d <printf+0xe3>
 5a3:	eb 65                	jmp    60a <printf+0x170>
        }
      } else if(c == 'c'){
 5a5:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5a9:	75 1d                	jne    5c8 <printf+0x12e>
        putc(fd, *ap);
 5ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ae:	8b 00                	mov    (%eax),%eax
 5b0:	0f be c0             	movsbl %al,%eax
 5b3:	83 ec 08             	sub    $0x8,%esp
 5b6:	50                   	push   %eax
 5b7:	ff 75 08             	pushl  0x8(%ebp)
 5ba:	e8 08 fe ff ff       	call   3c7 <putc>
 5bf:	83 c4 10             	add    $0x10,%esp
        ap++;
 5c2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c6:	eb 42                	jmp    60a <printf+0x170>
      } else if(c == '%'){
 5c8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5cc:	75 17                	jne    5e5 <printf+0x14b>
        putc(fd, c);
 5ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d1:	0f be c0             	movsbl %al,%eax
 5d4:	83 ec 08             	sub    $0x8,%esp
 5d7:	50                   	push   %eax
 5d8:	ff 75 08             	pushl  0x8(%ebp)
 5db:	e8 e7 fd ff ff       	call   3c7 <putc>
 5e0:	83 c4 10             	add    $0x10,%esp
 5e3:	eb 25                	jmp    60a <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5e5:	83 ec 08             	sub    $0x8,%esp
 5e8:	6a 25                	push   $0x25
 5ea:	ff 75 08             	pushl  0x8(%ebp)
 5ed:	e8 d5 fd ff ff       	call   3c7 <putc>
 5f2:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 5f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f8:	0f be c0             	movsbl %al,%eax
 5fb:	83 ec 08             	sub    $0x8,%esp
 5fe:	50                   	push   %eax
 5ff:	ff 75 08             	pushl  0x8(%ebp)
 602:	e8 c0 fd ff ff       	call   3c7 <putc>
 607:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 60a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 611:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 615:	8b 55 0c             	mov    0xc(%ebp),%edx
 618:	8b 45 f0             	mov    -0x10(%ebp),%eax
 61b:	01 d0                	add    %edx,%eax
 61d:	0f b6 00             	movzbl (%eax),%eax
 620:	84 c0                	test   %al,%al
 622:	0f 85 94 fe ff ff    	jne    4bc <printf+0x22>
    }
  }
}
 628:	90                   	nop
 629:	c9                   	leave  
 62a:	c3                   	ret    

0000062b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 62b:	55                   	push   %ebp
 62c:	89 e5                	mov    %esp,%ebp
 62e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 631:	8b 45 08             	mov    0x8(%ebp),%eax
 634:	83 e8 08             	sub    $0x8,%eax
 637:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63a:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 63f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 642:	eb 24                	jmp    668 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 644:	8b 45 fc             	mov    -0x4(%ebp),%eax
 647:	8b 00                	mov    (%eax),%eax
 649:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 64c:	72 12                	jb     660 <free+0x35>
 64e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 651:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 654:	77 24                	ja     67a <free+0x4f>
 656:	8b 45 fc             	mov    -0x4(%ebp),%eax
 659:	8b 00                	mov    (%eax),%eax
 65b:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 65e:	72 1a                	jb     67a <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 660:	8b 45 fc             	mov    -0x4(%ebp),%eax
 663:	8b 00                	mov    (%eax),%eax
 665:	89 45 fc             	mov    %eax,-0x4(%ebp)
 668:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 66e:	76 d4                	jbe    644 <free+0x19>
 670:	8b 45 fc             	mov    -0x4(%ebp),%eax
 673:	8b 00                	mov    (%eax),%eax
 675:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 678:	73 ca                	jae    644 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 67a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67d:	8b 40 04             	mov    0x4(%eax),%eax
 680:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 687:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68a:	01 c2                	add    %eax,%edx
 68c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68f:	8b 00                	mov    (%eax),%eax
 691:	39 c2                	cmp    %eax,%edx
 693:	75 24                	jne    6b9 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 695:	8b 45 f8             	mov    -0x8(%ebp),%eax
 698:	8b 50 04             	mov    0x4(%eax),%edx
 69b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69e:	8b 00                	mov    (%eax),%eax
 6a0:	8b 40 04             	mov    0x4(%eax),%eax
 6a3:	01 c2                	add    %eax,%edx
 6a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a8:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ae:	8b 00                	mov    (%eax),%eax
 6b0:	8b 10                	mov    (%eax),%edx
 6b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b5:	89 10                	mov    %edx,(%eax)
 6b7:	eb 0a                	jmp    6c3 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bc:	8b 10                	mov    (%eax),%edx
 6be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c1:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c6:	8b 40 04             	mov    0x4(%eax),%eax
 6c9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d3:	01 d0                	add    %edx,%eax
 6d5:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 6d8:	75 20                	jne    6fa <free+0xcf>
    p->s.size += bp->s.size;
 6da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dd:	8b 50 04             	mov    0x4(%eax),%edx
 6e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e3:	8b 40 04             	mov    0x4(%eax),%eax
 6e6:	01 c2                	add    %eax,%edx
 6e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6eb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f1:	8b 10                	mov    (%eax),%edx
 6f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f6:	89 10                	mov    %edx,(%eax)
 6f8:	eb 08                	jmp    702 <free+0xd7>
  } else
    p->s.ptr = bp;
 6fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 700:	89 10                	mov    %edx,(%eax)
  freep = p;
 702:	8b 45 fc             	mov    -0x4(%ebp),%eax
 705:	a3 e8 0b 00 00       	mov    %eax,0xbe8
}
 70a:	90                   	nop
 70b:	c9                   	leave  
 70c:	c3                   	ret    

0000070d <morecore>:

static Header*
morecore(uint nu)
{
 70d:	55                   	push   %ebp
 70e:	89 e5                	mov    %esp,%ebp
 710:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 713:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 71a:	77 07                	ja     723 <morecore+0x16>
    nu = 4096;
 71c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 723:	8b 45 08             	mov    0x8(%ebp),%eax
 726:	c1 e0 03             	shl    $0x3,%eax
 729:	83 ec 0c             	sub    $0xc,%esp
 72c:	50                   	push   %eax
 72d:	e8 3d fc ff ff       	call   36f <sbrk>
 732:	83 c4 10             	add    $0x10,%esp
 735:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 738:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 73c:	75 07                	jne    745 <morecore+0x38>
    return 0;
 73e:	b8 00 00 00 00       	mov    $0x0,%eax
 743:	eb 26                	jmp    76b <morecore+0x5e>
  hp = (Header*)p;
 745:	8b 45 f4             	mov    -0xc(%ebp),%eax
 748:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 74b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74e:	8b 55 08             	mov    0x8(%ebp),%edx
 751:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 754:	8b 45 f0             	mov    -0x10(%ebp),%eax
 757:	83 c0 08             	add    $0x8,%eax
 75a:	83 ec 0c             	sub    $0xc,%esp
 75d:	50                   	push   %eax
 75e:	e8 c8 fe ff ff       	call   62b <free>
 763:	83 c4 10             	add    $0x10,%esp
  return freep;
 766:	a1 e8 0b 00 00       	mov    0xbe8,%eax
}
 76b:	c9                   	leave  
 76c:	c3                   	ret    

0000076d <malloc>:

void*
malloc(uint nbytes)
{
 76d:	55                   	push   %ebp
 76e:	89 e5                	mov    %esp,%ebp
 770:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 773:	8b 45 08             	mov    0x8(%ebp),%eax
 776:	83 c0 07             	add    $0x7,%eax
 779:	c1 e8 03             	shr    $0x3,%eax
 77c:	83 c0 01             	add    $0x1,%eax
 77f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 782:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 787:	89 45 f0             	mov    %eax,-0x10(%ebp)
 78a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 78e:	75 23                	jne    7b3 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 790:	c7 45 f0 e0 0b 00 00 	movl   $0xbe0,-0x10(%ebp)
 797:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79a:	a3 e8 0b 00 00       	mov    %eax,0xbe8
 79f:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 7a4:	a3 e0 0b 00 00       	mov    %eax,0xbe0
    base.s.size = 0;
 7a9:	c7 05 e4 0b 00 00 00 	movl   $0x0,0xbe4
 7b0:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b6:	8b 00                	mov    (%eax),%eax
 7b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7be:	8b 40 04             	mov    0x4(%eax),%eax
 7c1:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7c4:	77 4d                	ja     813 <malloc+0xa6>
      if(p->s.size == nunits)
 7c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c9:	8b 40 04             	mov    0x4(%eax),%eax
 7cc:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7cf:	75 0c                	jne    7dd <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d4:	8b 10                	mov    (%eax),%edx
 7d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d9:	89 10                	mov    %edx,(%eax)
 7db:	eb 26                	jmp    803 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e0:	8b 40 04             	mov    0x4(%eax),%eax
 7e3:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7e6:	89 c2                	mov    %eax,%edx
 7e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7eb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f1:	8b 40 04             	mov    0x4(%eax),%eax
 7f4:	c1 e0 03             	shl    $0x3,%eax
 7f7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fd:	8b 55 ec             	mov    -0x14(%ebp),%edx
 800:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 803:	8b 45 f0             	mov    -0x10(%ebp),%eax
 806:	a3 e8 0b 00 00       	mov    %eax,0xbe8
      return (void*)(p + 1);
 80b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80e:	83 c0 08             	add    $0x8,%eax
 811:	eb 3b                	jmp    84e <malloc+0xe1>
    }
    if(p == freep)
 813:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 818:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 81b:	75 1e                	jne    83b <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 81d:	83 ec 0c             	sub    $0xc,%esp
 820:	ff 75 ec             	pushl  -0x14(%ebp)
 823:	e8 e5 fe ff ff       	call   70d <morecore>
 828:	83 c4 10             	add    $0x10,%esp
 82b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 82e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 832:	75 07                	jne    83b <malloc+0xce>
        return 0;
 834:	b8 00 00 00 00       	mov    $0x0,%eax
 839:	eb 13                	jmp    84e <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 83b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 841:	8b 45 f4             	mov    -0xc(%ebp),%eax
 844:	8b 00                	mov    (%eax),%eax
 846:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 849:	e9 6d ff ff ff       	jmp    7bb <malloc+0x4e>
  }
}
 84e:	c9                   	leave  
 84f:	c3                   	ret    

00000850 <hufs_thread_create>:

int thread_num = 0;


int hufs_thread_create(void *func(), void *args)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	83 ec 18             	sub    $0x18,%esp
	void *stack; 
	int pid;

	stack = malloc(4096);
 856:	83 ec 0c             	sub    $0xc,%esp
 859:	68 00 10 00 00       	push   $0x1000
 85e:	e8 0a ff ff ff       	call   76d <malloc>
 863:	83 c4 10             	add    $0x10,%esp
 866:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (stack==0) return -1;
 869:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 86d:	75 07                	jne    876 <hufs_thread_create+0x26>
 86f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 874:	eb 42                	jmp    8b8 <hufs_thread_create+0x68>

	pid = clone(func, args, stack); 
 876:	83 ec 04             	sub    $0x4,%esp
 879:	ff 75 f4             	pushl  -0xc(%ebp)
 87c:	ff 75 0c             	pushl  0xc(%ebp)
 87f:	ff 75 08             	pushl  0x8(%ebp)
 882:	e8 30 fb ff ff       	call   3b7 <clone>
 887:	83 c4 10             	add    $0x10,%esp
 88a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pid==-1) {
 88d:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 891:	75 15                	jne    8a8 <hufs_thread_create+0x58>
		free(stack);
 893:	83 ec 0c             	sub    $0xc,%esp
 896:	ff 75 f4             	pushl  -0xc(%ebp)
 899:	e8 8d fd ff ff       	call   62b <free>
 89e:	83 c4 10             	add    $0x10,%esp
		return -1;
 8a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8a6:	eb 10                	jmp    8b8 <hufs_thread_create+0x68>
	}

	thread_info[pid].stack = stack; 
 8a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8ae:	89 14 85 00 0c 00 00 	mov    %edx,0xc00(,%eax,4)

	return pid; 
 8b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 8b8:	c9                   	leave  
 8b9:	c3                   	ret    

000008ba <hufs_thread_join>:

int hufs_thread_join(int pid)
{
 8ba:	55                   	push   %ebp
 8bb:	89 e5                	mov    %esp,%ebp
 8bd:	83 ec 18             	sub    $0x18,%esp
	void *stack = thread_info[pid].stack;
 8c0:	8b 45 08             	mov    0x8(%ebp),%eax
 8c3:	8b 04 85 00 0c 00 00 	mov    0xc00(,%eax,4),%eax
 8ca:	89 45 f4             	mov    %eax,-0xc(%ebp)

	if (stack==0) return -1;
 8cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8d1:	75 07                	jne    8da <hufs_thread_join+0x20>
 8d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8d8:	eb 28                	jmp    902 <hufs_thread_join+0x48>

	join(&thread_info[pid].stack);	
 8da:	8b 45 08             	mov    0x8(%ebp),%eax
 8dd:	c1 e0 02             	shl    $0x2,%eax
 8e0:	05 00 0c 00 00       	add    $0xc00,%eax
 8e5:	83 ec 0c             	sub    $0xc,%esp
 8e8:	50                   	push   %eax
 8e9:	e8 d1 fa ff ff       	call   3bf <join>
 8ee:	83 c4 10             	add    $0x10,%esp
	free(stack);
 8f1:	83 ec 0c             	sub    $0xc,%esp
 8f4:	ff 75 f4             	pushl  -0xc(%ebp)
 8f7:	e8 2f fd ff ff       	call   62b <free>
 8fc:	83 c4 10             	add    $0x10,%esp

	return pid;
 8ff:	8b 45 08             	mov    0x8(%ebp),%eax
}
 902:	c9                   	leave  
 903:	c3                   	ret    
