org  0x100               ; Вказуємо, що це програма .COM
section .data
    a db 5               ; Визначаємо a = 5
    b db 3               ; Визначаємо b = 3
    c db 2               ; Визначаємо c = 2
    resultMsg db 'Result: $' ; Визначення рядка для виведення результату

section .text
_start:
    mov al, [b]          ; Завантажуємо b в al (al = 3)
    sub al, [c]          ; Віднімаємо c від al (al = 3 - 2 = 1)
    add al, [a]          ; Додаємо a до al (al = 1 + 5 = 6)

    ; Перетворення результату в ASCII символ
    add al, 30h          ; Перетворюємо число 6 в символ '6'

    ; Виведення рядка "Result: $"
    mov ah, 09h
    mov dx, resultMsg    ; Завантажуємо адресу повідомлення
    int 21h

    ; Виведення обчисленого символу
    mov dl, al
    mov ah, 02h
    int 21h

    ; Завершення програми
    mov ax, 4c00h
    int 21h