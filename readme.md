arp-scan
====

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

Параметры командной строки
-----

* -t: target, format: [IP/slash] or [IP]

Примеры
-----

```
arp-scan -t 192.168.1.1/24
arp-scan -t 172.20.10.1
```
