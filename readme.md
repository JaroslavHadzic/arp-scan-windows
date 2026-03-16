[![Build arp-scan](https://github.com/JaroslavHadzic/arp-scan-windows/actions/workflows/main.yml/badge.svg)](https://github.com/JaroslavHadzic/arp-scan-windows/actions/workflows/main.yml)

# arp-scan

arp-scan - windows port of the utility arp-scan, which scans a net with arp-requests and returns a table with MAC/IP matching.

## How to build

- Via raw GNU Toolchain (requires a GNU Toolchain distribution for Windows)
  
  ```bash
  gcc -O3 -o arp-scan.exe -I include src/*.c -l iphlpapi -l ws2_32 -static
  ```

- Via Makefile (requires a GNU Toolchain distribution for Windows + make utility):
  
  ```bash
  make
  ```

- Via CMake (requires cmake utility and any C compiling environment, here - MinGW + make):
  
  ```bash
  mkdir build
  cd build
  cmake .. -G "Unix Makefiles"
  make
  ```

- Via github-actions

For better compability, static compilation (gcc -static) reccomended.

## How to use

- -t: target, format: [IP/slash] or [IP]

## Examples

```bash
# Scan your home local network
arp-scan -t 192.168.1.0/24

# Send an arp-request to 172.20.10.1
arp-scan -t 172.20.10.1
```

---

arp-scan - порт под Windows утилиты, которая сканирует сеть arp-запросами, возвращая таблицу сопоставления MAC/IP для заданного диапазона

## Сборка проекта

- Чистый GNU Toolchain
  (требования - любой дистрибутив GNU Toolchain под Windows, MinGW, Msys, и т.д.):
  
  ```bash
  gcc -O3 -o arp-scan.exe -I include src/*.c -l iphlpapi -l ws2_32 -static
  ```

- Через Makefile
  (требования - GNU Toolchain + make):
  
  ```bash
  make
  ```

- Через CMake -> Makefile:
  
  (поддерживает и другие цели cmake, но для mingw прописана статическая линковка и высокая степень оптимизации)
  
  (требования - cmake + любой совместимый с целями cmake компилятор, mingw, msvc, и т.д.)
  
  ```bash
  mkdir build
  cd build
  cmake .. -G "Unix Makefiles"
  make
  ```

- Через Github Actions

Для лучшей совместимости, рекомендуется статическая компиляция.

Параметры командной строки
-----

* -t: target, format: [IP/slash] or [IP]

Примеры
-----

```
arp-scan -t 192.168.1.1/24
arp-scan -t 172.20.10.1
```
