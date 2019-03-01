https://courses.tss-yonder.com/open-source/teme/tema-1/

Bootstrap.sh

Va trebui să dezvoltați un script bash care se va ocupa de setările inițiale ale sistemului de operare. Script-ul va obține toate informațiile necesare dintr-un fișier de configurare disponibil în cadrul depozitului de cod în care este inclus.

Minimal scriptul va efectua următoarele acțiuni:

    va efectua actualizări pentru programele de sistem existente
    va configura toate interfețele de rețea disponibilie
    va configura procesul de SSH astfel încât autentificarea pe bază de parolă nu va mai putea fi efectuată, în schimb, veți putea folosi chei de tip RSA, pe care o veți și instala
    va reține datele de ieșire și mesajele de eroare în fișierul /var/log/system-bootstrap.log
    inspectează fișierul /etc/selinux/config și se asigură că parametrul ”SELINUX=” este ”disabled” după care va lansa comanda “setenforce 0”

