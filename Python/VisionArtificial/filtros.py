# Se importan las bibliotecas 
import cv2
import matplotlib.pyplot as plt

###Filtrado promediador
# Se carga una imagen a color y se muestra
goku = cv2.imread("Goku.jpg")
goku = cv2.cvtColor(goku, cv2.COLOR_BGR2RGB)

#Se muestra la imagen cargada
plt.imshow(goku)
plt.show()

import numpy as np
#Parametros del kernel
m = 9
n = 9

# Creación del Kernel
kernel = np.ones((m,n),np.float32)/(m*n)
# método para filtrar
filtrada = cv2.filter2D(goku,-1,kernel)

#Se muestra la imagen cargada
plt.imshow(filtrada)
plt.show()

###Filtro de mediana

# Se importan las bibliotecas 
import cv2
import matplotlib.pyplot as plt

# Se carga una imagen a escala de grises
ruidosa = cv2.imread("radiografia.png", cv2.IMREAD_GRAYSCALE)

#Se muestra la imagen cargada
plt.imshow(ruidosa, cmap='gray')
plt.show()

# Aplicación del kernel
filtrada = cv2.medianBlur(ruidosa, 3)

# Gráfica de la imagen filtrada
plt.imshow(filtrada, cmap='gray')
plt.show()

###Filtro gaussiano

# Se carga una imagen a color y se muestra
img = cv2.imread("perro_feliz.jpg")
img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

#Se muestra la imagen cargada
plt.imshow(img)
plt.show()

# Filtro gaussiano
filtrada_gau = cv2.GaussianBlur(img,(15,15),2)

# Se muestra la imagen filtrada
plt.imshow(filtrada_gau)
plt.show()

###Detección de bordes con Canny


# Lectura, filtrado y detección de bordes
img = cv2.imread('meme_gato.jpg', cv2.IMREAD_GRAYSCALE)
img = cv2.GaussianBlur(img,(7,7),1.5)
bordes = cv2.Canny(img,10,70)

# imagenes de los resultados
plt.figure(dpi=150)
plt.subplot(2,1,1)
plt.imshow(img, cmap = 'gray')
plt.title('Imagen original', fontsize=8)
plt.axis('off')

plt.subplot(2,1,2)
plt.imshow(bordes, cmap = 'gray')
plt.title('Bordes en la imagen', fontsize=8)
plt.axis('off')

plt.show()


