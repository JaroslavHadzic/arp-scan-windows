cmake_minimum_required(VERSION 3.10)
project(arp-scan C)

# Отладочные сообщения
message(STATUS "Система по мнению cmake: ${CMAKE_SYSTEM_NAME}")
message(STATUS "Компилятор по мнению cmake: ${CMAKE_C_COMPILER_ID}")

# Файлы с исходным кодом
add_executable(
    arp-scan
    src/getopt.c
    src/arp-scan.c
)

target_include_directories(arp-scan PRIVATE include)

# Проверка по косвенным признакам, что ОС - Windows,
# чтобы слинковать её с windows-либами iphlpapi и ws2_32
if(CMAKE_SYSTEM_NAME MATCHES "Windows|MSYS|CYGWIN")
    message(STATUS "Определена среда для ОС windows")
    target_link_libraries(arp-scan PRIVATE iphlpapi ws2_32)
endif()

# Если обнаружится gcc, то установить специфичные для него флаги
# Сборка с помощью gcc for windows - целевое решение
if(CMAKE_C_COMPILER_ID MATCHES "GNU")
    message(STATUS "Обнаружен gcc, ставлю совместимые флаги")
    target_compile_options(arp-scan PRIVATE -O3)
    target_link_options(arp-scan PRIVATE -static)
endif()
