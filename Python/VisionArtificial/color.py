# Se importan las bibliotecas 
import cv2
import matplotlib.pyplot as plt
import numpy as np
######################
#perro
# Se carga una imagen a color y se muestra
perro_im = cv2.imread("perro.jpg")
perro_im = cv2.cvtColor(perro_im, cv2.COLOR_BGR2RGB)
print('Las dimensiones de la imagen son', perro_im.shape)
plt.imshow(perro_im)
plt.show()

# Se utiliza el método cvtColor() para
# convertir la imagen a escala de grises
perro_gris = cv2.cvtColor(perro_im,cv2.COLOR_RGB2GRAY)
plt.imshow(perro_gris, cmap=plt.get_cmap('gray')
plt.show()

#Conviertiendo sin utilizar el método cv2.ctvColor() 
im_aux = perro_im.copy()
perro_Gris = np.zeros([im_aux.shape[0], im_aux.shape[1]], dtype=np.int8)
perro_Gris = (im_aux[:,:,0] * 0.299 + im_aux[:,:,1] * 0.587
                 + im_aux[:,:,2] * 0.114)
perro_Gris = np.round(perro_Gris)
perro_Gris = perro_Gris.astype(int)
perro = perro_Gris
plt.imshow(perro, cmap='gray')
plt.show()

cv2.imwrite('Perro_Grises.jpg', perro_Gris)

#Visulizar las capas de color
perro_rojo = perro_im.copy()
perro_rojo[:,:,1] =  perro_rojo[:,:,1]*0   #Se hace cero la capa verde
perro_rojo[:,:,2] =  perro_rojo[:,:,2]*0   #Se hace cero la capa azul
plt.imshow(perro_rojo)
plt.show()

#Visulizar las capas de color
perro_verde = perro_im.copy()
perro_verde[:,:,0] =  perro_verde[:,:,0]*0  #Se hace cero la capa verde
perro_verde[:,:,2] =  perro_verde[:,:,2]*0  #Se hace cero la capa azul
plt.imshow(perro_verde)
plt.show()

#Visulizar las capas de color
perro_azul = perro_im.copy()
perro_azul[:,:,0] =  perro_azul[:,:,0]*0  #Se hace cero la capa verde
perro_azul[:,:,1] =  perro_azul[:,:,1]*0  #Se hace cero la capa azul
plt.imshow(perro_azul)
plt.show()


#########################################
#Panda

panda = cv2.imread('panda.jpg')
panda = cv2.cvtColor(panda,cv2.COLOR_BGR2RGB)
if type(panda) is not np.ndarray:
    print('No se pudo cargar la imagen')
print('El tamaño de la imagen es', panda.shape)
plt.imshow(panda)
plt.show()

# Se cambia el tamaño de la imagen
largo = 1000
ancho = 800
tamaño = (largo, ancho)
panda_grande = cv2.resize(panda, tamaño, interpolation=cv2.INTER_CUBIC)
print('El tamaño de la imagen es', panda_grande.shape)
plt.figure(dpi=100)
plt.imshow(panda_grande)
plt.show()
