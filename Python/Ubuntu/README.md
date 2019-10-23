
### Python3
Docker con python3 instalado y las librerias mas comunes para trabajar con procesamiento de images y data science  


**Nota**: Puede ver y editar la lista de librerias dentro del Dockerfile para sus necesidades.  
          Esto cambiara el tamaño del Docker y su tiempo de compilacion  

**Nota**: Si necesita permisos sudo para correr docker utilize **"sudo ./correr.sh"** en vez de **"./correr"**.  


Descargar el archivo **Dockerfile** dentro de las carpetas y el script **correr.sh**.  
Editar la linea 3 de correr.sh para seleccionar el nombre del docker.  

Ejecutar en su consula (esto otorga permisos de ejecutable al script):  
```
chmod +x correr.sh
```

Compilar (solo la primera vez):  
```
./correr.sh build
```

Al correr el docker se montara la carpeta donde este trabajando  

Ipython3:  
```
./correr.sh ipython
```

Jupyter:  
```
./correr.sh
```


Puede agregar alias para correr el docker en cualquier carpeta:  
```
./correr.sh alias
```
