# -*- coding: utf-8 -*-
"""ModuloVisiónTT.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1kZhyDilKjnpttOAjXRH7UcmXtejB4TIU
"""

import matplotlib.pyplot as plt 
import numpy as np
import cv2
#Leer imagen
#image=cv2.imread("food2.png")
#image=cv2.imread("food3.png")
image=cv2.imread("food5.png")
#Orden de los canales BGR de la imagen
image[:,:,0]=image[:,:,0]*1#R
image[:,:,1]=image[:,:,1]*1#G
image[:,:,2]=image[:,:,2]*1#B

#################SOLO PARA ALGUNOS ENTORNOS
#Cambio de orden de los canales BGR a RGB
image = image[:, :, [2, 1, 0]]
#image = image[:, :, ::-1]

#Cambio de RGB a escala de grises
gray_im=np.zeros([image.shape[0],image.shape[1]],dtype=np.int8)#creando imagen con la misma cantidad de pixeles en x,y con valores de 0 a 8 bits - 0 a 255
gray_im=(image[:,:,0]*0.299+image[:,:,1]*0.587+image[:,:,2]*0.114)#Aplicando operaciones para modificar el canal RGB de la imagen original y guardándola en otra variable
#R*0.299
#G*0.587
#B*0.114
#plt.imshow(image)
#plt.imshow(image,cmap=plt.get_cmap('gray'))

#Mostrar imagen original
plt.imshow(image)
plt.title('Imagen original')
plt.show()

#Mostrar imagen en escala de grises
plt.imshow(gray_im,cmap=plt.get_cmap('gray'))
plt.title('Imagen en escala de grises')
plt.show()

#######################################################################################################################################
## Filtros Convolucionales
#Aplicar filtro Gaussiano para suavizar imagen
#filtrada = cv2.GaussianBlur(gray_im, (15,15), 2)
#filtrada = cv2.GaussianBlur(gray_im, (7,7), 1.5)
filtrada = cv2.GaussianBlur(gray_im, (7,7), 2)
#Mostrar imagen en escala de grises suavizada
plt.imshow(filtrada, cmap='gray')
plt.title('Imagen suavizada')
plt.show()

#Aplicar filtro para detección de bordes
#Cambio de tipo a entero de 8bits: 0 - 255
bordes = np.uint8(filtrada)
#Aplicar filtro Canny para detectar bordes
bordes=cv2.Canny(bordes,10,10)
#Mostrar imagen con bordes detectados
plt.imshow(bordes,cmap='gray')
plt.title('Bordes en la imagen')
#plt.axis('off')
plt.show()

# Umabralización de la imagen
filtrada2 = np.uint8(filtrada)
#######################################################################################################################################
#ret, th =  cv2.threshold(filtrada2,150, 255, cv2.THRESH_BINARY_INV)#Para alimentos en platos
#ret, th =  cv2.threshold(filtrada2,190, 255, cv2.THRESH_BINARY_INV)#Para simulación
ret, th =  cv2.threshold(filtrada2, 100, 255, cv2.THRESH_BINARY)#con food3.png y food4.png
plt.title('Imagen umbralizada/binaria')
plt.imshow(th, cmap='gray')
plt.show()

#Trazado del contorno
cont, ret = cv2.findContours(th, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
contornos = image.copy()
#Se dibujan los contornos
cv2.drawContours(contornos, cont, -1, (0,0,255),2)
plt.title('Detección de contornos en la image')
plt.imshow(contornos)
plt.show()

print('El número de contornos detectados en la imagen es:',len(cont))
#print(cont)
#print(ret)


# Cálculo de los momentos de una imagen
img_final = image.copy()
#img_final = cv2.cvtColor(img_final, cv2.COLOR_BGR2RGB)

for num, c in enumerate(cont):
  # Cálculo de los momentos 
  M=cv2.moments(c)
  if M['m00'] == 0:
      M['m00'] = 0.1
  
  # Cálculo del centroide
  x=int(M["m10"]/M["m00"])
  y=int(M['m01']/M['m00'])

  #Se colocan textos a cada objeto encontrado
  #mensaje = f'Objeto {num+1}'
  mensaje = f'*'
  #print('El área del objeto es', M['m00'])
  (h, w) = image.shape[:2] #w:image-width and h:image-height
  centerx=w//2
  centery=h//2
  print('Posición del objeto:',num+1)
  #print(x,y)
  #print(x-centerx,centery-y)#Posiciones referenciadas al centro de la imagen
  print(x-6,y+6)#Posición x,y con desfase
  print((x-6)-centerx,centery-(y+6))#Posiciones referenciadas al centro de la imagen con desfase
  #cv2.circle(img_final, (w//2, h//2), 7, (255, 255, 255), -1) 
  cv2.circle(img_final, (w//2, h//2), 7, (255, 255, 255), -1)
  
  #cv2.putText(img_final,mensaje,(x,y), cv2.FONT_HERSHEY_SIMPLEX, #Para objetos sin desfase
  cv2.putText(img_final,mensaje,(x-6,y+6), cv2.FONT_HERSHEY_SIMPLEX, #Para objetos con desfase
              1, (0,255,255), 2, cv2.LINE_AA)
  
  cv2.drawContours(img_final, [c], -1, (255,0,0), 2)#dibujar circulo en el centro

#dx, dy = 10,10
#grid_color = -1
#img_final[:,::dy] = grid_color
#img_final[::dx,:] = grid_color
plt.figure(figsize=(20,20))
plt.imshow(img_final)

plt.show()
print(w)
print(h)
